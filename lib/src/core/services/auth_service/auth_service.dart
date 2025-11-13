import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  bool _googleInitialized = false;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child(
    'users',
  );

  Stream<User?> authStateChanges() => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  Future<void> init() async {
    if (_googleInitialized) return;
    await _googleSignIn.initialize();
    _googleInitialized = true;
  }

  /// Sign in with Google (works for sign in & sign up)
  /// Returns `UserCredential` on success, `null` if user cancelled.
  Future<Map<String, dynamic>?> signInWithGoogle() async {
    try {
      await init();

      // Interactive authentication
      // NOTE: make it nullable so we can detect cancel
      final GoogleSignInAccount? googleUser =
      await _googleSignIn.authenticate(); // or .signIn() depending on your setup

      // User cancelled the Google picker
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      // google_sign_in ^7 often only has idToken, which is enough
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        // accessToken: googleAuth.accessToken, // optional / may be null
      );

      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      final User? user = userCredential.user;
      if (user == null) return null;


      final snapshot = await _dbRef.get();
      Map<String, dynamic> userData;

      if (!snapshot.exists) {
        // New user – create profile
        userData = {
          'name': user.displayName ?? '',
          'email': user.email ?? '',
          'phone': user.phoneNumber ?? '',
          'referralCode': '',
          'totalBalance': 0,
          'totalSessions': 0,
          'totalReferrals': 0,
          'earnedFromReferrals': 0,
          'userReferralCode': '',
          'joinedUsingReferral': [],
          'miningHistory': [],
          'createdAt': DateTime.now().toIso8601String(),
        };

        await _dbRef.set(userData);
      } else {
        // Existing user – update some fields
        await _dbRef.update({
          'name': user.displayName ?? '',
        });

        // Start from existing data
        final existing = snapshot.value as Map<dynamic, dynamic>;
        userData = {
          ...existing.map((key, value) => MapEntry(key.toString(), value)),
          'name': user.displayName ?? existing['name'] ?? '',
        };
      }

      // ✅ RETURN DB DATA, NOT CREDENTIALS
      return userData;
    } on FirebaseAuthException catch (e) {
      // Bubble up Firebase-specific errors to show in UI
      throw e;
    } catch (e) {
      // For debugging / logging you could wrap or log here
      rethrow;
    }
  }

  /// Try to sign in silently if a Google account is cached on device.
  Future<UserCredential?> trySilentSignIn() async {
    await init();
    final Future<GoogleSignInAccount?>? futureAccount = _googleSignIn
        .attemptLightweightAuthentication();
    if (futureAccount == null) return null;
    final GoogleSignInAccount? googleUser = await futureAccount;
    if (googleUser == null) return null;
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );
    return await _auth.signInWithCredential(credential);
  }

  /// Sign out from both Firebase and Google.
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  /// Disconnect revokes previous consent; next sign-in will re-prompt.
  Future<void> disconnect() async {
    await _googleSignIn.disconnect();
    await _auth.signOut();
  }

  /// LOGIN
  Future<Map<String, dynamic>?> login({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      final user = userCredential.user;
      if (user == null) return null;

      final DataSnapshot snapshot =
      await _dbRef.child('/${user.uid}').get();

      if (snapshot.exists && snapshot.value is Map) {
        // Convert Object? to Map<String, dynamic>
        final data = Map<String, dynamic>.from(snapshot.value as Map);
        return data;
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Login failed';
    } catch (e) {
      throw 'Login failed: $e';
    }
  }

  /// SIGN UP
  Future<Map<String, dynamic>?> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String referralCode,
  }) async {
    try {
      // 1) Create account in Firebase Auth
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: email.trim(),
            password: password,
          );

      final User? user = userCredential.user;
      if (user == null) return null;

      final userData = <String, dynamic>{
        'name': name,
        'email': email,
        'phone': phone,
        'referralCode': referralCode,
        'totalBalance': 0,
        'totalSessions': 0,
        'totalReferrals': 0,
        'earnedFromReferrals': 0,
        'userReferralCode': '',
        'joinedUsingReferral': [],
        'miningHistory': [],
        'createdAt': DateTime.now().toIso8601String(),
      };

      // 2) Save user data in Realtime Database (excluding password)
      await _dbRef.child(user.uid).set(userData);

      // 3) Optionally update displayName
      await user.updateDisplayName(name);

      return userData;
    } on FirebaseAuthException catch (e) {
      // handle Firebase specific errors
      throw e.message ?? 'Signup failed';
    } catch (e) {
      throw 'Signup failed: $e';
    }
  }
}
