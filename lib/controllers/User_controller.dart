import 'package:amwaj_car/Screen/Register&Login/Confirm_ownership_number_screen.dart';
import 'package:amwaj_car/Screen/driver/home_screen.dart';
import 'package:amwaj_car/controllers/Driver_controller.dart';
import 'package:amwaj_car/helpers/binding.dart';
import 'package:amwaj_car/helpers/helper.dart';
import 'package:amwaj_car/local_storage/shared_preferences/preferences.dart';
import 'package:amwaj_car/models/AddPassportNumIntoReadyTravelerModel.dart';
import 'package:amwaj_car/models/AddReservationClientModel.dart';
import 'package:amwaj_car/models/AddReservationModel.dart';
import 'package:amwaj_car/models/AddSecurityCodeReservation.dart';
import 'package:amwaj_car/models/AddTypeReservationModel.dart';
import 'package:amwaj_car/models/AllPaymentsRecordModel.dart';
import 'package:amwaj_car/models/GetDocumentationModel.dart';
import 'package:amwaj_car/models/GetPointsCountTravelerModel.dart';
import 'package:amwaj_car/models/GetReservationClientModel.dart';
import 'package:amwaj_car/models/MyReservationsModel.dart';
import 'package:amwaj_car/models/RegisterStep1Model.dart';
import 'package:amwaj_car/models/ResponseModel.dart';
import 'package:amwaj_car/models/TypeReservationModel.dart';
import 'package:amwaj_car/models/login_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Screen/Register&Login/complete_register_screen.dart';
import '../Screen/Register&Login/create_password_screen.dart';
import '../Screen/Register&Login/security_code_screen.dart';
import '../Screen/home_client/home_screen.dart';
import '../api/repository/user_response.dart';
import '../models/AddDocumentationModel.dart';
import '../models/AddedCarToReservationModel.dart';
import '../models/AllDataWalletUserModel.dart';
import '../models/DetailsTypeCarModel.dart';
import '../models/ProfileModel.dart';
import '../models/RegisterStep3Model.dart';
import '../models/RegisteredCompletedModel.dart';
import '../models/TypeCarModel.dart';
import '../models/UpdatedPasswordModel.dart';
import '../widget/showDialog.dart';
import 'AppController.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();
  UserRepository _userRepository = UserRepository();

  TextEditingController passport_numController = TextEditingController();
  TextEditingController phone_noController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController personal_idController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmationNewPasswordController = TextEditingController();
  TextEditingController redeemed_points_countController = TextEditingController();
  TextEditingController passport_numDocumentationController = TextEditingController();
  TextEditingController birth_dateDocumentationController = TextEditingController();
  TextEditingController AddPassportNumController = TextEditingController();

  RegisterStep1Model? _registerStep1Model;

  RegisterStep1Model get registerStep1Model => _registerStep1Model!;
  RegisterStep3Model? _registerStep3Model;

  RegisterStep3Model get registerStep3Model => _registerStep3Model!;
  AllDataWalletUserModel? _allDataWalletUserModel;

  AllDataWalletUserModel? get allDataWalletUserModel => _allDataWalletUserModel;
  ProfileModel? _profileModel;

  ProfileModel get profileModel => _profileModel!;
  UserModel? _userModel;

  UserModel get userModel => _userModel!;
  AddDocumentationModel? _addDocumentationModel;

  AddDocumentationModel get addDocumentationModel => _addDocumentationModel!;
  AddReservationClientModel? _addReservationClientModel;

  AddReservationClientModel get addReservationClientModel => _addReservationClientModel!;
  ResponseModel? _updateProfile;

  ResponseModel get updateProfile => _updateProfile!;

  UpdatedPasswordModel? _updatedPasswordModel;

  UpdatedPasswordModel get updatedPasswordModel => _updatedPasswordModel!;


  ResponseModel? _requestDocumentation;

  ResponseModel get requestDocumentation => _requestDocumentation!;
  GetDocumentationModel? _getDocumentationModel;

  GetDocumentationModel get getDocumentationModel => _getDocumentationModel!;
  GetReservationClientModel? _getReservationClientModel;

  GetReservationClientModel? get getReservationClientModel =>
      _getReservationClientModel;
  TypeReservationModel? _typeReservationModel;

  TypeReservationModel get typeReservationModel => _typeReservationModel!;
  AddTypeReservationModel? _addTypeReservationModel;

  AddTypeReservationModel get addTypeReservationModel =>
      _addTypeReservationModel!;
  GetPointsCountTravelerModel? _getPointsCountTravelerModel;

  GetPointsCountTravelerModel get getPointsCountTravelerModel =>
      _getPointsCountTravelerModel!;
  NotGetPointsCountTravelerModel? _notGetPointsCountTravelerModel;

  NotGetPointsCountTravelerModel get notGetPointsCountTravelerModel =>
      _notGetPointsCountTravelerModel!;
  DetailsTypeCarModel? _detailsTypeCarModel;

  DetailsTypeCarModel get detailsTypeCarModel => _detailsTypeCarModel!;
  MyReservationsModel? _myReservationsModel;

  MyReservationsModel get myReservationsModel => _myReservationsModel!;
  AllPaymentsRecordModel? _allPaymentsRecordModel;

  AllPaymentsRecordModel get allPaymentsRecordModel => _allPaymentsRecordModel!;
  AddPassportNumIntoReadyTravelerModel? _addPassportNumIntoReadyTravelerModel;

  AddPassportNumIntoReadyTravelerModel
      get addPassportNumIntoReadyTravelerModel =>
          _addPassportNumIntoReadyTravelerModel!;
  AddReservationModel? _addReservationModel;

  AddReservationModel get addReservationModel => _addReservationModel!;

  TypeCarModel? _typeCarModel;

  TypeCarModel get typeCarModel => _typeCarModel!;
  AddedCarToReservationModel? _addedCarToReservationModel;

  AddedCarToReservationModel get addedCarToReservationModel =>
      _addedCarToReservationModel!;
  AddSecurityCodeReservation? _addSecurityCodeReservation;

  AddSecurityCodeReservation get addSecurityCodeReservation =>
      _addSecurityCodeReservation!;

  RegisteredCompletedModel? _registeredCompletedModel;

  RegisteredCompletedModel get registeredCompletedModel =>
      _registeredCompletedModel!;

  RxString typeBookingScreen = 'display'.obs;
  XFile? passportImagesFile;
  XFile? profileImage;
  RxInt indexDocumentation = 0.obs;
  RxInt agreement = 0.obs;
  late RxInt travel;

  RxString textCode = ''.obs;
  RxString personal_id = ''.obs;
  RxString security_code = ''.obs;
  RxInt role = 1.obs;
  late RxInt typeReservations;
  late int carId;

  RxString code = ''.obs;
  RxString selectType = ''.obs;
  RxString addIndividuals = '0'.obs;
  List<int> cliId = [];

  RxBool loginLoading = false.obs;
  RxBool changePasswordLoading = false.obs;
  RxBool profileLoading = false.obs;
  RxBool typeCarLoading = false.obs;
  RxBool securityCodeLoading = false.obs;
  RxBool requestDocumentationLoading = false.obs;
  RxBool getDocumentationLoading = false.obs;
  RxBool getReservationsClientLoading = false.obs;
  RxBool updateProfileLoading = false.obs;
  RxBool dataRegisterLoading = false.obs;
  RxBool phoneNoLoading = false.obs;
  RxBool passwordLoading = false.obs;
  RxBool logoutLoading = false.obs;
  RxBool confirmationCodeLoading = false.obs;
  RxBool allDataLoading = false.obs;
  RxBool redeemRequestLoading = false.obs;
  RxBool addDocumentationLoading = false.obs;
  RxBool addReservationsLoading = false.obs;
  RxBool getPointsCountTravelerLoading = false.obs;
  RxBool getCartTypeLoading = false.obs;

  RxBool addTypeReservationsLoading = false.obs;
  RxBool typeReservationsLoading = false.obs;
  RxBool getAllPaymentsRecordLoading = false.obs;
  RxBool AddPassportNumIntoReadLoading = false.obs;
  RxBool MyReservationsLoading = false.obs;
  RxBool addedCarToReservationLoading = false.obs;

  void login({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else if (personal_idController.text.isEmpty) {
      Helper.showSnackBar(context,
          text: 'Personal_ID_required'.tr, error: true);
    } else if (passwordLoginController.text.isEmpty) {
      Helper.showSnackBar(context, text: 'password_required'.tr, error: true);
    } else {
      loginLoading.value = true;
      update();
      _userRepository
          .loginApi(
        context: context,
        personal_id: personal_idController.text,
        password: passwordLoginController.text,
      )
          .then((value) {
        if (value != null) {
          _userModel = UserModel.fromJson(value.data);
          print('loginApi value.data ${value.data}');
          if (_userModel?.code == 200) {
            loginLoading.value = false;
            getAllPaymentsRecord();
            HiveController().setToken(userModel.data?.token ?? '');
            HiveController().setTypeAccount(userModel.data?.roles?.first.name ?? '');
            AppController.to.login.value = 'yes';
            if (_userModel?.data?.roles?.first.name == 'driver') {
              Get.offAll(HomeDriverScreen(), binding: Binding());
            }

            AppController.to.changeIndex(4);
            update();
          } else {
            loginLoading.value = false;
            Helper.showSnackBar(context,
                text: _userModel?.message ?? '', error: true);
            update();
          }
        }
      });
    }
  }

  void logout() async {
    logoutLoading.value = true;
    _userRepository.logoutApi().then((value) {
      if (value != null) {
        if (value.statusCode == 200) {
          logoutLoading.value = false;
        } else if (value.statusCode != 500) {
          logoutLoading.value = false;
        } else {
          logoutLoading.value = false;
        }
      }
    });
  }

  void initializationRegister() async {
    print('start initializationRegister');
    update();
    _userRepository.initializationRegisterApi().then((value) {
      if (value != null) {
        if (value.statusCode == 200) {
          AppController.to.type.value = 'register';
          print('successfully initializationRegister ${value.data}');
          update();
        }
      }
    });
    print('finish initializationRegister');
  }

  void phoneNo({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else {
      phoneNoLoading.value = true;
      update();
      _userRepository
          .phoneApi(context: context, phone_no: phone_noController.text)
          .then((value) {
        if (value != null) {
          _registerStep1Model = RegisterStep1Model.fromJson(value.data);
          if (_registerStep1Model?.code == 200) {
            phoneNoLoading.value = false;
            textCode.value = _registerStep1Model?.data?.code ?? '';
            print('successfully phoneNo ${value.data}');
            print('successfully phoneNo textCode${textCode.value}');
            phone_noController.clear();
            if (textCode.value != '') {
              Get.to(ConfirmOwnershipNumberScreen(), binding: Binding());
              update();
            }
          } else {
            phoneNoLoading.value = false;
            Helper.showSnackBar(context,
                text: _registerStep1Model?.message ?? "", error: true);
          }
        }
      });
    }
  }

  void confirmationCode({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else if (code.value == '') {
      Helper.showSnackBar(context,
          text: 'You_must_enter_redemption_code'.tr, error: true);
    } else {
      confirmationCodeLoading.value = true;
      bool? value = await _userRepository.confirmationCodeApi(
          context: context, code: code.value);
      if (value == true) {
        confirmationCodeLoading.value = false;
        Get.to(CreatePasswordScreen(), binding: Binding());
        update();
      } else {
        confirmationCodeLoading.value = false;
      }
    }
  }

  void password({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else if (passwordController.text.isEmpty) {
      Helper.showSnackBar(context, text: 'password_required'.tr, error: true);
    } else {
      passwordLoading.value = true;
      update();
      bool? value = await _userRepository.passwordApi(
          context: context, password: passwordController.text);
      if (value != false) {
        Get.to(CompleteRegisterScreen(), binding: Binding());
        passwordLoading.value = false;
        passwordController.clear();
        update();
      } else {
        passwordLoading.value = false;
      }
    }
  }

  void securityCode({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else if (security_code.value.isEmpty) {
      Helper.showSnackBar(context,
          text: 'Please_enter_the_code_to_complete_the_process'.tr,
          error: true);
    } else {
      securityCodeLoading.value = true;
      update();
      var value = await _userRepository.securityCodeApi(
          context: context, security_code: security_code.value);
      if (value != null) {
        _registeredCompletedModel =
            RegisteredCompletedModel.fromJson(value.data);
        if (_registeredCompletedModel?.code == 200) {
          personal_id.value = _registeredCompletedModel?.data?.personalId ?? '';
          print('type before ${AppController.to.type.value}');
          if (personal_id.value != '') {
            securityCodeLoading.value = false;
            security_code.value = '';
            AppController.to.type.value = 'successfully';
            update();
            AppController.to.changeIndex(1);
            Get.to(HomeScreen());
            print('type after ${AppController.to.type.value}');
            update();
          }
          update();
        } else {
          securityCodeLoading.value = false;
          Helper.showSnackBar(context,
              text: _registeredCompletedModel?.message ?? "", error: true);
          update();
        }
      }
    }
  }

  void dataRegister({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    }  else {
      dataRegisterLoading.value = true;
      _userRepository.dataRegisterApi(context: context, data: {
        'passport_num': passport_numController.text,
        'agreement': agreement.value,
        'role': role.value,
        if (passportImagesFile == null)
          'passport_images': await dio.MultipartFile.fromFile(passportImagesFile!.path),
      }).then((value) {
        if (value != false) {
          passport_numController.clear();
          dataRegisterLoading.value = false;
          Get.to(SecurityCodeScreen());
          update();
        } else {
          dataRegisterLoading.value = false;
        }
      });
    }
  }

  void allDataWalletUser() async {
    allDataLoading.value = true;
    update();
    _userRepository.allDataWalletUserApi().then((value) {
      if (value != null) {
        _allDataWalletUserModel = AllDataWalletUserModel.fromJson(value.data);
        if (_allDataWalletUserModel?.code == 200) {
          allDataLoading.value = false;
          print('successfully get all data wallet user');
          print('successfully get all data wallet    ${value.data}');
          update();
        } else {
          allDataLoading.value = false;
          update();
        }
      }
    });
  }

  void redeemRequest({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else if (redeemed_points_countController.text.isEmpty) {
      Helper.showSnackBar(context,
          text: 'Personal_ID_required'.tr, error: true);
    } else {
      redeemRequestLoading.value = true;
      update();
      _userRepository
          .redeemRequestAPI(
              context: context,
              redeemed_points_count: redeemed_points_countController.text)
          .then((value) {
        if (value != null) {
          if (value.data == '') {
            redeemRequestLoading.value = false;
            print('successfully redeemRequest');
            update();
          } else {
            redeemRequestLoading.value = false;
            print('error redeemRequest');
            Helper.showSnackBar(context, text: value.toString(), error: true);
            update();
          }
        }
      });
    }
  }

  void addDocumentation({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else if (redeemed_points_countController.text.isEmpty) {
      Helper.showSnackBar(context,
          text: 'Personal_ID_required'.tr, error: true);
    } else {
      addDocumentationLoading.value = true;
      update();
      _userRepository
          .addDocumentationAPI(
        context: context,
        passport_num: passport_numDocumentationController.text,
        birth_date: birth_dateDocumentationController.text,
      )
          .then((value) {
        if (value != null) {
          _addDocumentationModel = AddDocumentationModel.fromJson(value.data);
          if (_addDocumentationModel?.code == 200) {
            addDocumentationLoading.value = false;
            print('successfully redeemRequest');
            update();
          } else {
            addDocumentationLoading.value = false;
            print('error redeemRequest');
            Helper.showSnackBar(context, text:_addDocumentationModel?.message??"", error: true);
            update();
          }
        }
      });
    }
  }

  void changePassword({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else if (confirmationNewPasswordController.text.isEmpty) {
      Helper.showSnackBar(context,
          text: 'Confirm_new_password'.tr, error: true);
    }
    else if (oldPasswordController.text.isEmpty) {
      Helper.showSnackBar(context,
          text: 'Enter_the_old_password'.tr, error: true);
    }else if (newPasswordController.text.isEmpty) {
      Helper.showSnackBar(context,
          text: 'Enter_a_new_password'.tr, error: true);
    }
    else {
      changePasswordLoading.value = true;
      update();
      _userRepository.updatePasswordAPI(
        context: context,
          confirmation_new_password:confirmationNewPasswordController.text ,
          new_password:newPasswordController.text ,old_password:  oldPasswordController.text
      ).then((value) {
        if (value != null) {
          _updatedPasswordModel = UpdatedPasswordModel.fromJson(value.data);
          if (_updatedPasswordModel?.code == 200) {
            changePasswordLoading.value = false;
            print('successfully redeemRequest');
            update();
          } else {
            changePasswordLoading.value = false;
            print('error redeemRequest');
            Helper.showSnackBar(context, text:_updatedPasswordModel?.message??"", error: true);
            update();
          }
        }
      });
    }
  }

  void getRequestDocumentationUser() async {
    requestDocumentationLoading.value = true;
    update();
    _userRepository.getRequestDocumentationApi().then((value) {
      if (value != null) {
        _requestDocumentation = ResponseModel.fromJson(value.data);
        print('getRequestDocumentationUser get ${value.data}');
        if (_requestDocumentation?.code == 200) {
          requestDocumentationLoading.value = false;
          print('successfully getRequestDocumentationUser');
          update();
        } else {
          requestDocumentationLoading.value = false;
          update();
        }
      }
    });
  }

  void getDocumentationUser() async {
    getDocumentationLoading.value = true;
    update();
    _userRepository.getDocumentationApi().then((value) {
      if (value != null) {
        _getDocumentationModel = GetDocumentationModel.fromJson(value.data);

        ///   print('getDocumentationUser get ${value.data}');
        if (_getDocumentationModel?.code == 200) {
          getDocumentationLoading.value = false;
          print('successfully getDocumentationUser');
          update();
        } else {
          getDocumentationLoading.value = false;
          update();
        }
      }
    });
  }

  void getReservationsClient() async {
    getReservationsClientLoading.value = true;
    update();
    _userRepository.getReservationsClientApi().then((value) {
      if (value != null) {
        _getReservationClientModel =
            GetReservationClientModel.fromJson(value.data);
        print('getReservationsClient get ${value.data}');
        if (_getReservationClientModel?.code == 200) {
          getReservationsClientLoading.value = false;
          print('successfully getReservationsClient ${value.data}');
          update();
        } else {
          getReservationsClientLoading.value = false;
          update();
        }
      }
    });
  }

  void showProfileUser() async {
    profileLoading.value = true;
    update();
    _userRepository.showProfileApi().then((value) {
      if (value != null) {
        _profileModel = ProfileModel.fromJson(value.data);
        if (_profileModel?.status == 200) {
          profileLoading.value = false;
          print('successfully get show profile user');
          update();
        } else {
          profileLoading.value = false;
          update();
        }
      }
    });
  }

  void updateProfileUser({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else if (profileImage == null) {
      Helper.showSnackBar(context, text: 'photo_required', error: true);
    } else {
      updateProfileLoading.value = true;
      update();
      _userRepository.updateProfileApi(context: context, data: {
        if (profileImage == null)
          'image': await dio.MultipartFile.fromFile(profileImage!.path),
      }).then((value) {
        if (value != null) {
          _updateProfile = ResponseModel.fromJson(value.data);
          if (_updateProfile?.code == 201) {
            updateProfileLoading.value = false;
            if(HiveController().type == 'driver') DriverController.to.showProfileDriver();
            if(HiveController().type != 'driver') showProfileUser();
            Get.back();
            print('successfully get update profile user');
            update();
          } else {
            updateProfileLoading.value = false;
            update();
          }
        }
      });
    }
  }

  void selectImage() async {
    profileImage = await Helper.selectImage();
    update();
  }

  changeDocumentationIndex(int index) {
    indexDocumentation.value = index;
    update();
  }

  addIndividual() {
    if (addIndividuals.value == '1') {
      addIndividuals.value = '0';
    } else {
      addIndividuals.value = '1';
    }
    update();
  }

  void addReservations({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else if (redeemed_points_countController.text.isEmpty) {
      Helper.showSnackBar(context,
          text: 'Personal_ID_required'.tr, error: true);
    } else {
      addReservationsLoading.value = true;
      update();
      _userRepository
          .addReservationsAPI(
              context: context,
              car_id: carId,
              clients: cliId,
              travel: travel.value)
          .then((value) {
        if (value != null) {
          _addReservationModel = AddReservationModel.fromJson(value.data);
          if (_addReservationModel?.code == 200) {
            addReservationsLoading.value = false;
            print('successfully addReservations');
            print('successfully addReservations ${value.data}');
            update();
          } else {
            addReservationsLoading.value = false;
            print('error addReservations');
            Helper.showSnackBar(context, text:_addReservationModel!.message.toString() , error: true);
            update();
          }
        }
      });
    }
  }

  void getTypeReservations() async {
    typeReservationsLoading.value = true;
    update();
    _userRepository.getTypeReservationsApi().then((value) {
      if (value != null) {
        _typeReservationModel = TypeReservationModel.fromJson(value.data);
        if (_typeReservationModel?.code == 200) {
          typeReservationsLoading.value = false;
          print('successfully getTypeReservations');
          update();
        } else {
          typeReservationsLoading.value = false;
          update();
        }
      }
    });
  }

  void getAllPaymentsRecord() async {
    getAllPaymentsRecordLoading.value = true;
    update();
    _userRepository.getAllPaymentsRecordApi().then((value) {
      if (value != null) {
        _allPaymentsRecordModel = AllPaymentsRecordModel.fromJson(value.data);

        ///   print('getAllPaymentsRecord get ${value.data}');
        if (_allPaymentsRecordModel?.code == 200) {
          getAllPaymentsRecordLoading.value = false;
          print('successfully getAllPaymentsRecord');
          print('successfully getAllPaymentsRecord ${value.data}');
          update();
        } else {
          getAllPaymentsRecordLoading.value = false;
          update();
        }
      }
    });
  }

  void addTypeReservations({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else if (selectType.value.isEmpty) {
      Helper.showSnackBar(context, text: 'Booking_type'.tr, error: true);
    } else {
      addTypeReservationsLoading.value = true;
      update();
      _userRepository
          .addTypeReservationsAPI(context: context, type: selectType.value)
          .then((value) {
        if (value != null) {
          _addTypeReservationModel =
              AddTypeReservationModel.fromJson(value.data);
          if (_addTypeReservationModel?.code == 200) {
            getPointsCountTraveler();
            addTypeReservationsLoading.value = false;
            update();
            print('successfully addTypeReservations ${value.data}');
            update();
          } else {
            addTypeReservationsLoading.value = false;
            print('error addTypeReservations');
            Helper.showSnackBar(context, text:_addTypeReservationModel?.message??"", error: true);
            update();
          }
        }
      });
    }
  }

  void getPointsCountTraveler() async {
    print(' selectType.value get ${selectType.value}');
    getPointsCountTravelerLoading.value = true;
    update();
    _userRepository.getPointsCountTravelerApi().then((value) {
      if (value != null) {
        selectType.value == '1'
            ? _notGetPointsCountTravelerModel =
                NotGetPointsCountTravelerModel.fromJson(value.data)
            : _getPointsCountTravelerModel =
                GetPointsCountTravelerModel.fromJson(value.data);

        print('getPointsCountTraveler get ${value.data}');
        if (_getPointsCountTravelerModel?.code == 200) {
          getPointsCountTravelerLoading.value = false;
          print('successfully getPointsCountTraveler');
          update();
        } else {
          getPointsCountTravelerLoading.value = false;
          update();
        }
      }
    });
  }

  void getDetailsTypeCart(BuildContext context, int id) async {
    print('getDetailsTypeCart id $id');
    getCartTypeLoading.value = true;
    update();
    _userRepository.getDetailsCarApi(id).then((value) {
      if (value != null) {
        _detailsTypeCarModel = DetailsTypeCarModel.fromJson(value.data);
        print('getDetailsTypeCart get ${value.data}');
        if (_detailsTypeCarModel?.code == 200) {
          getCartTypeLoading.value = false;
          detailsCarDialog(context: context);
          print('successfully getDetailsTypeCart');
          carId = id;
          update();
        } else {
          getCartTypeLoading.value = false;
          Helper.showSnackBar(context,
              text: _userModel?.message ?? '', error: true);
          update();
        }
      }
    });
  }

  void addPassportNumIntoReadyTraveler({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else if (AddPassportNumController.text.isEmpty) {
      Helper.showSnackBar(context,
          text: 'Passport_number_is_required'.tr, error: true);
    } else {
      AddPassportNumIntoReadLoading.value = true;
      update();
      _userRepository
          .addPassportNumIntoReadyTravelerAPI(
        context: context,
        passport_num: AddPassportNumController.text,
      )
          .then((value) {
        if (value != null) {
          _addPassportNumIntoReadyTravelerModel =
              AddPassportNumIntoReadyTravelerModel.fromJson(value.data);
          if (_addPassportNumIntoReadyTravelerModel?.code == 200) {
            AddPassportNumIntoReadLoading.value = false;
            print('successfully addPassportNumIntoReadyTraveler');
            update();
          } else {
            AddPassportNumIntoReadLoading.value = false;
            print('error addPassportNumIntoReadyTraveler');
            Helper.showSnackBar(context, text:_addPassportNumIntoReadyTravelerModel?.message??"", error: true);
            update();
          }
        }
      });
    }
  }

  void getMyReservations() async {
    MyReservationsLoading.value = true;
    update();
    _userRepository.getMyReservationsApi().then((value) {
      if (value != null) {
        _myReservationsModel = MyReservationsModel.fromJson(value.data);
        if (_myReservationsModel?.code == 200) {
          MyReservationsLoading.value = false;
          print('successfully getTypeReservations ${value.data}');
          print('successfully getTypeReservations');
          update();
        } else {
          MyReservationsLoading.value = false;
          update();
        }
      }
    });
  }

  void getTypeCar(BuildContext context) async {
    typeCarLoading.value = true;
    update();
    _userRepository.getTypeCarApi().then((value) {
      if (value != null) {
        _typeCarModel = TypeCarModel.fromJson(value.data);
        if (_typeCarModel?.code == 200) {
          typeCarLoading.value = false;
          customizationDialog(context: context);
          print('successfully getTypeCar ${value.data}');
          print('successfully getTypeCar');
          update();
        } else {
          typeCarLoading.value = false;
          update();
        }
      }
    });
  }

  void addedCarToReservation({required BuildContext context}) async {
    print('  Reservation carId ${carId}');
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else if (carId == null) {
      Helper.showSnackBar(context,
          text: 'Please_choose_the_car'.tr, error: true);
    } else {
      AddPassportNumIntoReadLoading.value = true;
      update();
      _userRepository
          .addCarToReservationsAPI(
        context: context,
        car_id: carId,
      )
          .then((value) {
        if (value != null) {
          _addedCarToReservationModel =
              AddedCarToReservationModel.fromJson(value.data);
          if (_addedCarToReservationModel?.code == 200) {
            addedCarToReservationLoading.value = false;
            Get.back();
            Get.back();
            print('successfully addedCarToReservation');
            update();
          } else {
            addedCarToReservationLoading.value = false;
            print('error addedCarToReservation');
            Helper.showSnackBar(context, text: _addedCarToReservationModel?.message??"", error: true);
            update();
          }
        }
      });
    }
  }
}
