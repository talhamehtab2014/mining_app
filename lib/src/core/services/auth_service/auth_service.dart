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
  Future<UserCredential?> signInWithGoogle() async {
    try {
      await init();

      // Interactive authentication
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // google_sign_in ^7 returns only idToken via `authentication`.
      // accessToken may be unavailable; Firebase accepts idToken alone.
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException {
      rethrow;
    } catch (_) {
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
  Future<User?> login({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Login failed';
    } catch (e) {
      throw 'Login failed: $e';
    }
  }

  /// SIGN UP
  Future<User?> signUp({
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

      // 2) Save user data in Realtime Database (excluding password)
      await _dbRef.child(user.uid).set({
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
      });

      // 3) Optionally update displayName
      await user.updateDisplayName(name);

      return user;
    } on FirebaseAuthException catch (e) {
      // handle Firebase specific errors
      throw e.message ?? 'Signup failed';
    } catch (e) {
      throw 'Signup failed: $e';
    }
  }
}
