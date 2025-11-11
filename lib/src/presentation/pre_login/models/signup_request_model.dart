class SignupRequestModel {
  String strName;
  String strEmail;
  String strPassword;
  String? strPhoneNumber;
  String? strReferralCode;

  SignupRequestModel({
    required this.strEmail,
    required this.strName,
    required this.strPassword,
    this.strPhoneNumber,
    this.strReferralCode,
  });
}
