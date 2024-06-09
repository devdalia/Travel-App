import 'dart:developer';

import 'package:amwaj_car/api/helper/api_mixin.dart';
import 'package:amwaj_car/models/ResponseModel.dart';
import 'package:amwaj_car/utilities/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AccountRecoveryResponse with ApiMixin {
  Future<Response?> forgotPasswordApi(
      {required BuildContext context, required String passport_num}) async {
    try {
      var response = await dio.post(forgotPasswordUrl, data: {
        'passport_num': passport_num,
      });
      log('forgotPasswordApi=>' + response.data.toString());
      return response;
    } on DioError catch (e) {
      log('forgotPasswordApi=>' + e.response!.data.toString());
      if (e.response?.statusCode != 500) {
        showMessage(context, e.response!, error: true);
        return e.response;
      } else {
        handleServerError(context);
        return e.response;
      }
    }
  }

  Future<bool?> checkCodeApi(
      {required BuildContext context, required String code}) async {
    try {
      var response = await dio.post(checkCodeUrl, data: {
        'code': code,
      });
      log('checkCodeApi=>' + response.data.toString());
      return true;
    } on DioError catch (e) {
      log('checkCodeApi=>' + e.response!.data.toString());
      if (e.response?.statusCode != 500) {
        showMessage(context, e.response!, error: true);
        return false;
      } else {
        handleServerError(context);
        return false;
      }
    }
  }

  Future<bool> resetPasswordApi(
      {required BuildContext context,
      required String password,
      required String password_confirmation,
      required String passport_num}) async {
    try {
      var response = await dio.post(resetPasswordUrl, data: {
        'password': password,
        'password_confirmation': password_confirmation,
        'passport_num': passport_num,
      });
      log('checkCodeApi=>' + response.data.toString());
      return true;
    } on DioError catch (e) {
      log('checkCodeApi=>' + e.response!.data.toString());
      if (e.response?.statusCode != 500) {
        showMessage(context, e.response!, error: true);
        return false;
      } else {
        handleServerError(context);
        return false;
      }
    }
  }

  Future<bool> propertyRightsApi(
      {required BuildContext context,
      required Map<String, dynamic> data}) async {
    try {
      dio.options.headers = requestHeaders;
      var response =
          await dio.post(propertyRightsUrl, data: FormData.fromMap(data));
      log('PropertyRightsApi=>' + response.data.toString());
      return true;
    } on DioError catch (e) {
      log('PropertyRightsApi=>' + e.response!.data.toString());
      if (e.response?.statusCode != 500) {
        showMessage(context, e.response!, error: true);
        return false;
      } else {
        handleServerError(context);
        return false;
      }
    }
  }

  Future<ResponseModel?> selectOptionApi(
      {required BuildContext context,
      required int mobile,
      required int property_rights}) async {
    try {
      var response = await dio.post(selectOptionUrl, data: {
        'mobile': mobile,
        'property_rights': property_rights,
      });
      log('selectOptionApi=>' + response.data.toString());
      return ResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      log('selectOptionApi=>' + e.response!.data.toString());
      if (e.response?.statusCode != 500) {
        showMessage(context, e.response!, error: true);
        return null;
      } else {
        handleServerError(context);
        return null;
      }
    }
  }
}
