import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:injectable/injectable.dart';

part 'failure.dart';

abstract class ErrorHandler {
  static const String SUCCESS = '00000';
  static const String ClientProtocolException = 'clientError';
  static const String RANDOM_ERROR = '';
  static const String REACH_MAX_CAPTCHA_REQUEST = '81037';
  static const String CAPTCHA_ERROR = '81036';
  static const String USER_VALIDATION_ERROR = '81032';
  static const String CAPTCHA_VALUE_NOT_FOUND = '81045';
  static const String OTP_VALIDATION_FAILED = '81034';
  static const String USER_ENROLMENT_VALIDATION_ERROR = '81039';
  static const String ENTITY_ACCESS_VALIDATION_ERROR = '81035';
  static const String USER_ALREADY_REGISTERED_ERROR = '82030';
  static const String USER_WHILE_CREATING_USER = '82031';
  static const String INVALID_LOGIN_REQUEST = '81040';
  static const String TIME_OUT = '401';
  static const String LOGIN_USER_NOT_VALID = '81038';
  static const String NO_DATA_FOUND = '70110';
  static const String INVALID_CREDENTIALS = '81051';
  static const String ACCOUNT_LOCKED = '81053';
  static const String FORCE_UPDATE = '81044';
  static const String Invalid_Reference_Number = 'Invalid_Reference_Number';
  static const String Bill_Not_Found = 'Bill_Not_Found';
  static const String TAHAQAQPHONENOTMATCHED = '1201';
  static const String ERROR_PVV = '02113';
  static const String Invalid_otp = '80030';

  Failure resolveErrors({required Response<dynamic> response});

  Failure handleStatusCode(String internalCode, {String? desc});

  Failure throwDefaultFailure();

  Failure throwImageDefaultFailure();

  Failure mapErrorCodeToFailure(
      String errorCode, {
        String errorDescription = '',
      }) {
    debugPrint("mapErrorCodeToFailure : $errorCode -> $errorDescription");
    switch (errorCode) {
      case FORCE_UPDATE:
        return const ForceUpdateFailure();
      case ACCOUNT_LOCKED:
        return const AccountLockedFailure();
      case INVALID_CREDENTIALS:
        return const InvalidCredentialsFailure();
      case REACH_MAX_CAPTCHA_REQUEST:
        return const ReachMaxCaptchaRequestFailure();
      case CAPTCHA_ERROR:
        return const CaptchaErrorFailure();
      case USER_VALIDATION_ERROR:
        return const UserValidationErrorFailure();
      case USER_ENROLMENT_VALIDATION_ERROR:
        return const UserEnrolmentValidationErrorFailure();
      case ENTITY_ACCESS_VALIDATION_ERROR:
        return const EntityAccessValidationErrorFailure();
      case CAPTCHA_VALUE_NOT_FOUND:
        return const CaptchaValueNotFoundFailure();
      case OTP_VALIDATION_FAILED:
        return const OTPValidationFailedFailure();
      case USER_ALREADY_REGISTERED_ERROR:
        return const UserAlreadyRegisteredErrorFailure();
      case USER_WHILE_CREATING_USER:
        return const UserWhileCreatingUserFailure();
      case INVALID_LOGIN_REQUEST:
        return const InvalidLoginRequestFailure();
      case TIME_OUT:
        return const TimeoutFailure();
      case LOGIN_USER_NOT_VALID:
        return const LoginUserNotValidFailure();
      case NO_DATA_FOUND:
        return const NoDataFoundFailure();
      case '18905':
      case '18904':
      case '81046':
      case '81041':
        return const SomethingWentWrongFailure();
      case '20003':
        return const BillAlreadyExistsErrorFailure();
      case Invalid_Reference_Number:
        return const InvalidReferenceNumberFailure();
      case Bill_Not_Found:
        return const BillNotFoundFailure();
      case Invalid_otp:
        return const InvalidOtpFailure();
      case ERROR_PVV:
        return const InvalidPVVFailure();
      default:
        if (errorDescription.isEmpty || errorDescription.length > 100) {
          return const SomethingWentWrongFailure();
        } else {
          return DefaultFailure(errorDescription);
        }
    }
  }

  String getErrorMessageFromErrorCode({
    required String? errorCode,
    String? errorDescription,
  }) {
    errorDescription ??= "";
    switch (errorCode) {
      case FORCE_UPDATE:
        return 'forceUpdate'.tr;
      case ACCOUNT_LOCKED:
        return 'account_locked'.tr;
      case INVALID_CREDENTIALS:
        return 'invalid_credentials'.tr;
      case REACH_MAX_CAPTCHA_REQUEST:
        return 'reach_max_captcha_request'.tr;
      case CAPTCHA_ERROR:
        return 'captcha_error'.tr;
      case USER_VALIDATION_ERROR:
        return 'user_validation_error'.tr;
      case USER_ENROLMENT_VALIDATION_ERROR:
        return 'user_enrolment_validation_error'.tr;
      case ENTITY_ACCESS_VALIDATION_ERROR:
        return 'entity_access_validation_error'.tr;
      case CAPTCHA_VALUE_NOT_FOUND:
        return 'captcha_value_not_found'.tr;
      case OTP_VALIDATION_FAILED:
        return 'otp_validation_failed'.tr;
      case USER_ALREADY_REGISTERED_ERROR:
        return 'user_already_registered_error'.tr;
      case USER_WHILE_CREATING_USER:
        return 'user_while_creating_user'.tr;
      case INVALID_LOGIN_REQUEST:
        return 'invalid_login_request'.tr;
      case TIME_OUT:
        return 'time_out'.tr;
      case LOGIN_USER_NOT_VALID:
        return 'login_user_not_valid'.tr;
      case NO_DATA_FOUND:
        return 'no_data_found'.tr;
      case '18905':
      case '18904':
      case '81046':
      case '81041':
        return 'something_went_wrong'.tr;
      case '20003':
        return "billAlreadyExistsError".tr;

      case Invalid_Reference_Number:
        return "invalidReferenceNumber".tr;
      case Bill_Not_Found:
        return "billNotFound".tr;
      default:
        if (errorDescription.isEmpty || errorDescription.length > 100) {
          return 'something_went_wrong'.tr;
        } else {
          return errorDescription;
        }
    }
  }
}

@LazySingleton(as: ErrorHandler)
class AmexErrorHandlerImp extends ErrorHandler {
  @override
  Failure resolveErrors({required Response<dynamic> response}) {
    try {
      dynamic responseInfo = response.data;

      return handleStatusCode(
        responseInfo.errorCode,
        desc: responseInfo.errorDescription,
      );
    } on TypeError catch (e) {
      throw throwDefaultFailure();
    } catch (e) {
      throw throwDefaultFailure();
    }
  }

  @override
  Failure handleStatusCode(String internalCode, {String? desc}) {
    debugPrint("handleStatusCode: $desc");
    return mapErrorCodeToFailure(
      internalCode.toString(),
      errorDescription: desc ?? '',
    );
  }

  @override
  Failure throwDefaultFailure() {
    return DefaultFailure('something_went_wrong');
  }

  @override
  Failure throwImageDefaultFailure() {
    return DefaultFailure('network_error_please_try_again');
  }
}
