import 'package:amwaj_car/Screen/Register&Login/account_recovery_with_equity_screen.dart';
import 'package:amwaj_car/Screen/Register&Login/account_recovery_with_mobile_screen.dart';
import 'package:amwaj_car/Screen/Register&Login/change_password_screen.dart';
import 'package:amwaj_car/Screen/home_client/home_screen.dart';
import 'package:amwaj_car/api/repository/AccountRecovery_Response.dart';
import 'package:amwaj_car/helpers/helper.dart';
import 'package:amwaj_car/models/ResponseModel.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../helpers/binding.dart';
import 'AppController.dart';

class AccountRecoveryController extends GetxController {
  static AccountRecoveryController get to => Get.find();
  AccountRecoveryResponse _recoveryResponse = AccountRecoveryResponse();

  TextEditingController passport_numController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password_confirmationController =
      TextEditingController();
  TextEditingController passport_numPropertyRightsController =
      TextEditingController();
  TextEditingController phone_noController = TextEditingController();

  ResponseModel? _forgetPassword;

  ResponseModel get forgetPassword => _forgetPassword!;

  XFile? passportImagesFile;
  RxInt mobile = 1.obs;
  RxInt property_rights = 0.obs;
  RxString code = ''.obs;
  RxBool SelectOptionLoading = false.obs;
  bool propertyRightsLoading = false;
  RxBool forgotPasswordLoading = false.obs;
  RxBool checkCodeLoading = false.obs;
  RxBool resetPasswordLoading = false.obs;
  RxBool sendCode = false.obs;

  void SelectOption({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else if (mobile.value == 0 && property_rights.value == 0) {
      Helper.showSnackBar(context,
          text: 'Account_recovery_method_must_be_selected'.tr, error: true);
    } else {
      SelectOptionLoading.value = true;
      update();
      ResponseModel? model = await _recoveryResponse.selectOptionApi(
          context: context,
          mobile: mobile.value,
          property_rights: property_rights.value);
      if (model != null) {
        if (mobile.value == 1) {
          Get.off(AccountRecoveryWithMobileScreen());
        } else {
          Get.off(AccountRecoveryWithEquityScreen());
        }
      }
      SelectOptionLoading.value = false;
      mobile.value = 1;
      property_rights.value = 0;
      update();
    }
  }

  void forgotPassword({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else if (passport_numController.text.isEmpty) {
      Helper.showSnackBar(context,
          text: 'Passport_number_is_required'.tr, error: true);
    } else {
      forgotPasswordLoading.value = true;
      update();
      _recoveryResponse
          .forgotPasswordApi(
              context: context, passport_num: passport_numController.text)
          .then((value) {
        if (value != null) {
          _forgetPassword = ResponseModel.fromJson(value.data);
          if (_forgetPassword?.code == 200) {
            sendCode.value = true;
            forgotPasswordLoading.value = false;
            update();
          } else {
            forgotPasswordLoading.value = false;
            Helper.showSnackBar(context,
                text: _forgetPassword?.message ?? '', error: true);
            update();
          }
        }
      });
    }
  }

  void checkCode({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else if (code.value == '') {
      Helper.showSnackBar(context,
          text: 'You_must_enter_redemption_code'.tr, error: true);
    } else {
      checkCodeLoading.value = true;
      update();
      bool? response = await _recoveryResponse.checkCodeApi(
          context: context, code: code.value);
      if (response == true) {
        Get.to(ChangePasswordScreen(), binding: Binding());
      }
      checkCodeLoading.value = false;
      update();
    }
  }

  void resetPassword({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else if (passwordController.text.isEmpty) {
      Helper.showSnackBar(context, text: 'password_required'.tr, error: true);
    } else if (password_confirmationController.text.isEmpty) {
      Helper.showSnackBar(context,
          text: 'Password_confirmation_is_required'.tr, error: true);
    } else {
      resetPasswordLoading.value = true;
      update();
      bool response = await _recoveryResponse.resetPasswordApi(
          context: context,
          password: passwordController.text,
          passport_num: passport_numController.text,
          password_confirmation: password_confirmationController.text);
      if (response == true) {
        Get.offAll(HomeScreen(), binding: Binding());
        AppController.to.type.value = 'login';
        AppController.to.changeIndex(1);
      }
      resetPasswordLoading.value = false;
      update();
    }
  }
  void PropertyRights({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else if (passport_numController.text.isEmpty) {
      Helper.showSnackBar(context,
          text: 'Passport_number_is_required'.tr, error: true);
    } else if (phone_noController.text.isEmpty) {
      Helper.showSnackBar(context,
          text: 'Mobile_number_Is_required'.tr, error: true);
    } else if (passportImagesFile == null) {
      Helper.showSnackBar(context,
          text: 'Passport_photo_required'.tr, error: true);
    } else {
      propertyRightsLoading = true;
      update();
      bool response =
          await _recoveryResponse.propertyRightsApi(context: context, data: {
        'passport_num': passport_numPropertyRightsController.text,
        'phone_no': phone_noController.text,
        if (passportImagesFile != null)
          'passport_images':
              await dio.MultipartFile.fromFile(passportImagesFile!.path),
      });
      if (response == true) {
        propertyRightsLoading = false;
        Get.snackbar('Your_request_has_been_submitted_successfully'.tr, '',
            onTap: (GetSnackBar) {
          Get.off(HomeScreen(), binding: Binding());
          AppController.to.type.value = 'login';
        });
        update();
      } else {
        propertyRightsLoading = false;
        update();
      }
    }
  }




}
