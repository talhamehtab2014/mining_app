part of 'error_handler.dart';

abstract class Failure implements Exception {
  final String message;

  const Failure(this.message);
}

class ForceUpdateFailure extends Failure {
  const ForceUpdateFailure() : super('forceUpdate');
}

class AccountLockedFailure extends Failure {
  const AccountLockedFailure() : super('account_locked');
}

class InvalidCredentialsFailure extends Failure {
  const InvalidCredentialsFailure() : super('invalid_credentials');
}

class ReachMaxCaptchaRequestFailure extends Failure {
  const ReachMaxCaptchaRequestFailure() : super('reach_max_captcha_request');
}

class CaptchaErrorFailure extends Failure {
  const CaptchaErrorFailure() : super('captcha_error');
}

class UserValidationErrorFailure extends Failure {
  const UserValidationErrorFailure() : super('user_validation_error');
}

class UserEnrolmentValidationErrorFailure extends Failure {
  const UserEnrolmentValidationErrorFailure()
      : super('user_enrolment_validation_error');
}

class EntityAccessValidationErrorFailure extends Failure {
  const EntityAccessValidationErrorFailure()
      : super('entity_access_validation_error');
}

class CaptchaValueNotFoundFailure extends Failure {
  const CaptchaValueNotFoundFailure() : super('captcha_value_not_found');
}

class OTPValidationFailedFailure extends Failure {
  const OTPValidationFailedFailure() : super('otp_validation_failed');
}

class UserAlreadyRegisteredErrorFailure extends Failure {
  const UserAlreadyRegisteredErrorFailure()
      : super('user_already_registered_error');
}

class UserWhileCreatingUserFailure extends Failure {
  const UserWhileCreatingUserFailure() : super('user_while_creating_user');
}

class InvalidLoginRequestFailure extends Failure {
  const InvalidLoginRequestFailure() : super('invalid_login_request');
}

class TimeoutFailure extends Failure {
  const TimeoutFailure() : super('time_out');
}

class LoginUserNotValidFailure extends Failure {
  const LoginUserNotValidFailure() : super('login_user_not_valid');
}

class NoDataFoundFailure extends Failure {
  const NoDataFoundFailure() : super('no_data_found');
}

class SomethingWentWrongFailure extends Failure {
  const SomethingWentWrongFailure() : super('something_went_wrong');
}

class BillAlreadyExistsErrorFailure extends Failure {
  const BillAlreadyExistsErrorFailure() : super('billAlreadyExistsError');
}

class InvalidReferenceNumberFailure extends Failure {
  const InvalidReferenceNumberFailure() : super('invalidReferenceNumber');
}

class BillNotFoundFailure extends Failure {
  const BillNotFoundFailure() : super('billNotFound');
}

//no internet connection
class NoInternetConnectionFailure extends Failure {
  const NoInternetConnectionFailure() : super('no_internet_connection');
}

// Default failure for unhandled cases
class DefaultFailure extends Failure {
  const DefaultFailure(String message) : super(message);
}


class PasscodeNotSetFailure extends Failure {
  const PasscodeNotSetFailure() : super('PasscodeNotSet');
}

class NotEnrolledFailure extends Failure {
  const NotEnrolledFailure() : super('NotEnrolled');
}


class InvalidPVVFailure extends Failure {
  const InvalidPVVFailure() : super('invalid_pvv');
}

class InvalidOtpFailure extends Failure {
  const InvalidOtpFailure() : super('invalid_otp');
}


class NotAvailableFailure extends Failure {
  const NotAvailableFailure() : super('NotAvailable');
}

class OtherOperatingSystemFailure extends Failure {
  const OtherOperatingSystemFailure() : super('OtherOperatingSystem');
}

class LockedOutFailure extends Failure {
  const LockedOutFailure() : super('LockedOut');
}

class PermanentlyLockedOutFailure extends Failure {
  const PermanentlyLockedOutFailure() : super('PermanentlyLockedOut');
}

class BiometricOnlyNotSupportedFailure extends Failure {
  const BiometricOnlyNotSupportedFailure() : super('biometricOnlyNotSupported');
}

class UnknownLocalAuthFailure extends Failure {
  const UnknownLocalAuthFailure([String code = 'Unknown']) : super(code);
}

class InvalidCredentialFailure extends Failure {
  @override
  final String message;

  InvalidCredentialFailure(
      this.message,
      ) : super(message);
}

class SomethingWentWrong extends Failure {
  @override
  final String message;

  SomethingWentWrong(
      this.message,
      ) : super(message);
}

class NoInternetConnection extends Failure {
  NoInternetConnection(String message) : super(message);
}

abstract class InAppReviewException implements Failure {
  final String message;

  const InAppReviewException(this.message);
}

class InAppReviewAvailabilityException extends InAppReviewException {
  const InAppReviewAvailabilityException(String message) : super(message);
}

class InAppReviewRequestException extends InAppReviewException {
  const InAppReviewRequestException(String message) : super(message);
}

/// Labiba Chat specific failures
class LabibaChatFailure extends Failure {
  const LabibaChatFailure(String message) : super(message);
}
