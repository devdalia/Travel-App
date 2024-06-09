import 'dart:developer';

import 'package:amwaj_car/api/helper/api_mixin.dart';
import 'package:amwaj_car/utilities/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DriverRepository with ApiMixin {

  Future<Response?> createJourneyApi(
      {required BuildContext context,
        required String passport_num,
        required int travel}) async {
    try {
      var response = await dio.post('jurnies/create-jurney/$travel', data: {
        'passport_num': passport_num
      });
      log('createJourneyApi=>' + response.data.toString());
      return response;
    } on DioError catch (e) {
      log('createJourneyApi=>' + e.response!.data.toString());
      if (e.response?.statusCode != 500) {
        showMessage(context, e.response!, error: true);
        return e.response;
      } else {
        handleServerError(context);
        return e.response;
      }
    }
  }

  Future<Response?> openJourneyApi(int JourneyNum) async {
    try {
      dio.options.headers = header;
      var response = await dio.get('jurnies/open-jurney/$JourneyNum');
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> startJourneyApi() async {
    try {
      dio.options.headers = header;
      var response = await dio.get(startJourneyUrl);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> finishingJourneyApi() async {
    try {
      dio.options.headers = header;
      var response = await dio.get(finishingJourneyUrl);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> getAllConfirmedReservationsApi() async {
    try {
      dio.options.headers = header;
      var response = await dio.get(getAllConfirmedReservationsUrl);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> paymentsTravelersApi() async {
    try {
      dio.options.headers = header;
      var response = await dio.get(paymentsTravelersUrl);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> addPassportNumIntoReadyTravelingApi(
      {required BuildContext context,
        required String passport_num,
        required int travel}) async {
    try {
      var response = await dio.post(addPassportNumIntoReadyTravelingUrl, data: {
        'passport_num': passport_num,
        'travel': travel,
      });
      log('addPassportNumIntoReadyTravelingApi=>' + response.data.toString());
      return response;
    } on DioError catch (e) {
      log('addPassportNumIntoReadyTravelingApi=>' + e.response!.data.toString());
      if (e.response?.statusCode != 500) {
        showMessage(context, e.response!, error: true);
        return e.response;
      } else {
        handleServerError(context);
        return e.response;
      }
    }
  }

  Future<Response?> showProfileApi() async {
    try {
      dio.options.headers = header;
      var response = await dio.get(showProfileUrl);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response?> cancelConfirmReservationApi(int id,int num ) async {
    try {
      dio.options.headers = header;
      var response = await dio.get('reservations/cancel-confirm-reservation/$id/$num');
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
