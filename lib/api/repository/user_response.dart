import 'dart:developer';

import 'package:amwaj_car/api/helper/api_mixin.dart';
import 'package:amwaj_car/utilities/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../local_storage/shared_preferences/preferences.dart';

class UserRepository with ApiMixin {
  Future<Response?> loginApi(
      {required BuildContext context,
      required String personal_id,
      required String password}) async {
    try {
      var response = await dio.post(loginUrl, data: {
        'personal_id': personal_id,
        'password': password,
      });
      log('login=>' + response.data.toString());
      return response;
    } on DioError catch (e) {
      log('login=>' + e.response!.data.toString());
      if (e.response?.statusCode != 500) {
        showMessage(context, e.response!, error: true);
        return e.response;
      } else {
        handleServerError(context);
        return e.response;
      }
    }
  }

  Future<Response?> logoutApi() async {
    try {
      dio.options.headers = header;
      var response = await dio.get(logoutUrl);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> initializationRegisterApi() async {
    try {
      dio.options.headers = requestHeaders;
      var response = await dio.get(initializationRegisterUrl);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> phoneApi(
      {required BuildContext context, required String phone_no}) async {
    try {
      var response = await dio.post(registerStep1Url, data: {
        'phone_no': phone_no,
      });
      log('phoneApi=>' + response.data.toString());
      return response;
    } on DioError catch (e) {
      log('phoneApi=>' + e.response!.data.toString());
      if (e.response?.statusCode != 500) {
        showMessage(context, e.response!, error: true);
        return e.response;
      } else {
        handleServerError(context);
        return e.response;
      }
    }
  }

  Future<bool> confirmationCodeApi(
      {required BuildContext context, required String code}) async {
    try {
      var response = await dio.post(confirmationCodeUrl, data: {
        'code': code,
      });
      log('confirmationCodeApi=>' + response.data.toString());
      return true;
    } on DioError catch (e) {
      log('confirmationCodeApi=>' + e.response!.data.toString());
      if (e.response?.statusCode != 500) {
        showMessage(context, e.response!, error: true);
        return false;
      } else {
        handleServerError(context);
        return false;
      }
    }
  }

  Future<bool?> passwordApi(
      {required BuildContext context, required String password}) async {
    try {
      var response = await dio.post(registerStep2Url, data: {
        'password': password,
      });
      log('passwordApi=>' + response.data.toString());
      return true;
    } on DioError catch (e) {
      log('passwordApi=>' + e.response!.data.toString());
      if (e.response?.statusCode != 500) {
        showMessage(context, e.response!, error: true);
        return false;
      } else {
        handleServerError(context);
        return false;
      }
    }
  }

  Future<Response?> securityCodeApi(
      {required BuildContext context, required String security_code}) async {
    try {
      var response = await dio.post(registerStep4Url, data: {
        'security_code': security_code,
      });
      log('securityCodeApi=>' + response.data.toString());
      return response;
    } on DioError catch (e) {
      log('securityCodeApi=>' + e.response!.data.toString());
      if (e.response?.statusCode != 500) {
        showMessage(context, e.response!, error: true);
        return e.response;
      } else {
        handleServerError(context);
        return e.response;
      }
    }
  }

  Future<bool?> dataRegisterApi(
      {required BuildContext context,
      required Map<String, dynamic> data}) async {
    try {
      dio.options.headers = requestHeaders;
      var response =
          await dio.post(registerStep3Url, data: FormData.fromMap(data));
      log('dataRegisterApi=>' + response.data.toString());
      return true;
    } on DioError catch (e) {
      log('dataRegisterApi=>' + e.response!.data.toString());
      if (e.response?.statusCode != 500) {
        showMessage(context, e.response!, error: true);
        return false;
      } else {
        handleServerError(context);
        return false;
      }
    }
  }

  Future<Response?> allDataWalletUserApi() async {
    try {
      dio.options.headers = requestHeaders;
      var response = await dio.get(allDataWalletUserUrl);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> redeemRequestAPI(
      {required BuildContext context,
      required String redeemed_points_count}) async {
    try {
      var response = await dio.post(redeemedRequestUrl,
          data: {'redeemed_points_count': redeemed_points_count});
      log('redeemRequestAPI=>' + response.data.toString());
      return response;
    } on DioError catch (e) {
      log('redeemRequestAPI=>' + e.response!.data.toString());
      return e.response;
    }
  }

  Future<Response?> addDocumentationAPI(
      {required BuildContext context,
      required String passport_num,
      required String birth_date}) async {
    try {
      var response = await dio.post(addDocumentationUrl,
          data: {'passport_num': passport_num, 'birth_date': birth_date});
      log('addDocumentationAPI=>' + response.data.toString());
      return response;
    } on DioError catch (e) {
      log('addDocumentationAPI=>' + e.response!.data.toString());
      return e.response;
    }
  }


    Future<Response?> showProfileApi() async {
      try {
        dio.options.headers = requestHeaders;
        var response = await dio.get(showProfileUrl);
        return response;
      } on DioError catch (e) {
        return e.response;
      }
    }

  Future<Response?> getRequestDocumentationApi() async {
    try {
      dio.options.headers = requestHeaders;
      var response = await dio.get(requestDocumentationUrl);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> getDocumentationApi() async {
    try {
      dio.options.headers = requestHeaders;
      var response = await dio.get(getDocumentationUrl);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> getReservationsClientApi() async {
    try {
      dio.options.headers = requestHeaders;
      var response = await dio.get(getReservationsClientUrl);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }


  Future<Response?> updateProfileApi(
      {required BuildContext context,
      required Map<String, dynamic> data}) async {
    try {
      if(HiveController().type == 'driver')
      dio.options.headers = header;
      if(HiveController().type != 'driver')
      dio.options.headers = requestHeaders;
      var response =
          await dio.post(updateProfileUrl, data: FormData.fromMap(data));
      log('updateProfileApi=>' + response.data.toString());
      return response;
    } on DioError catch (e) {
      log('updateProfileApi=>' + e.response!.data.toString());
      if (e.response?.statusCode != 500) {
        showMessage(context, e.response!, error: true);
        return e.response;
      } else {
        handleServerError(context);
        return e.response;
      }
    }
  }

  Future<Response?> getTypeReservationsApi() async {
    try {
      dio.options.headers = requestHeaders;
      var response = await dio.get(typeReservationsUrl);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }
  Future<Response?>getAllPaymentsRecordApi() async {
    try {
      dio.options.headers = requestHeaders;
      var response = await dio.get(allPaymentsRecordUrl);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> getPointsCountTravelerApi() async {
    try {
      dio.options.headers = header;
      var response = await dio.get(getPointsCountTravelerUrl);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }



  Future<Response?> addReservationsAPI(
      {required BuildContext context,
      required int car_id,
      required int travel,
      required List<int> clients}) async {
    try {
      var response = await dio.post(addReservationsUrl,
          data: {'car_id': car_id,
            'travel': travel,
            'clients': clients});
      log('addReservationsAPI=>' + response.data.toString());
      return response;
    } on DioError catch (e) {
      log('addReservationsAPI=>' + e.response!.data.toString());
      return e.response;
    }
  }



  Future<Response?>updatePasswordAPI(
      {required BuildContext context,
      required String old_password,
      required String confirmation_new_password,
      required String new_password }) async {
    try {
      var response = await dio.post(updatePasswordUrl,
          data: {'old_password': old_password,
            'new_password': new_password,
            'confirmation_new_password': confirmation_new_password
             });
      log('updatePasswordAPI=>' + response.data.toString());
      return response;
    } on DioError catch (e) {
      log('updatePasswordAPI=>' + e.response!.data.toString());
      return e.response;
    }
  }

  Future<Response?> addTypeReservationsAPI(
      {required BuildContext context, required String type}) async {
    try {
      var response =
          await dio.post(addTypeReservationsUrl, data: {'type': type});
      log('addTypeReservationsAPI=>' + response.data.toString());
      return response;
    } on DioError catch (e) {
      log('addTypeReservationsAPI=>' + e.response!.data.toString());
      return e.response;
    }
  }


  Future<Response?> addPassportNumIntoReadyTravelerAPI(
      {required BuildContext context,
        required String passport_num }) async {
    try {
      var response = await dio.post(addPassportNumIntoReadyTravelerUrl,
          data: {'passport_num': passport_num});
      log('addPassportNumIntoReadyTravelerAPI=>' + response.data.toString());
      return response;
    } on DioError catch (e) {
      log('addPassportNumIntoReadyTravelerAPI=>' + e.response!.data.toString());
      return e.response;
    }
  }

  Future<Response?> getMyReservationsApi() async {
    try {
      dio.options.headers = requestHeaders;
      var response = await dio.get(getMyReservationsUrl);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }
  Future<Response?> getTypeCarApi() async {
    try {
      dio.options.headers = requestHeaders;
      var response = await dio.get(getTypeCarUrl);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }
  Future<Response?> getDetailsCarApi(int id ) async {
    try {
      dio.options.headers = header;
      var response = await dio.get('reservations/get-data-cars-via-type/$id');
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }


  Future<Response?> addCarToReservationsAPI(
      {required BuildContext context, required int car_id}) async {
    try {
      var response =
      await dio.post(addCarToReservationsUrl, data: {'car_id': car_id});
      log('addCarToReservationsAPI=>' + response.data.toString());
      return response;
    } on DioError catch (e) {
      log('addCarToReservationsAPI=>' + e.response!.data.toString());
      return e.response;
    }
  }
}
