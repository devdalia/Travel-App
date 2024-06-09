
import 'dart:developer';
import 'dart:io';
import 'package:amwaj_car/helpers/helper.dart';
import 'package:amwaj_car/local_storage/shared_preferences/preferences.dart';
import 'package:amwaj_car/utilities/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

mixin  ApiMixin {

  bool isSuccessRequest(int statusCode) {
    return statusCode == 200;
  }

  void handleServerError(BuildContext context) {
    Helper.showSnackBar(context,
        text: 'Unable to perform your request now!', error: true);
  }

  void showMessage(BuildContext context, Response response, {bool error = false}) {
    try{
      String errors = '';
      if(response.data['errors'].runtimeType.toString() != 'List<dynamic>'){
        log('type=> ${response.data['errors'].runtimeType}');
        dynamic data = response.data['errors'];
        data.forEach((key, value) {
          errors += '\n $value';
        });
      }
      Helper.showSnackBar(context,
          text: '${response.data['message']} $errors', error: error);
    }catch (e){
      log(e.toString());
    }

  }

  Map<String, String> get requestHeaders {
    return {
      HttpHeaders.authorizationHeader :'Bearer ' + HiveController().token,
      'Accept': 'application/json',
      'Accept-Language': HiveController().languageCode
    };
  }


  Map<String, String> get header {
    return {
      HttpHeaders.authorizationHeader:'Bearer ' + HiveController().token,
      'X-Requested-With': 'XMLHttpRequest',
    };
  }

  Dio dio = Dio(BaseOptions(baseUrl: baseUrl, contentType: 'application/json',headers:{
    'X-Requested-With': 'XMLHttpRequest',
    'Accept': 'application/json',
    'lang': HiveController().languageCode
  } ));

}

