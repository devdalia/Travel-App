import 'package:amwaj_car/api/repository/driver_response.dart';
import 'package:amwaj_car/api/repository/user_response.dart';
import 'package:amwaj_car/controllers/AppController.dart';
import 'package:amwaj_car/helpers/helper.dart';
import 'package:amwaj_car/models/ResponseModel.dart';
import 'package:amwaj_car/models/driver/DriverProfile.dart';
import 'package:amwaj_car/models/driver/OpenJourneyModel.dart';
import 'package:amwaj_car/models/driver/PaymentsTravelersModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/driver/AddPassportNumIntoReadyTravelingModel.dart';
import '../models/driver/CreateJourneyModel.dart';
import '../models/driver/GetAllConfirmedReservationsModel.dart';
import '../models/driver/StartJourneyModel.dart';

class DriverController extends GetxController {
  static DriverController get to => Get.find();
  DriverRepository _driverRepository = DriverRepository();
  OpenJourneyModel? _openJourneyModel;
  OpenJourneyModel get openJourneyModel => _openJourneyModel!;
  CreateJourneyModel? _createJourneyModel;
  CreateJourneyModel get  createJourneyModel => _createJourneyModel!;
  DriverProfile? _driverProfile;
  DriverProfile get  driverProfile => _driverProfile!;
  StartJourneyModel? _startJourneyModel;
  StartJourneyModel get  startJourneyModel => _startJourneyModel!;

  PaymentsTravelersModel? _paymentsTravelersModel;
  PaymentsTravelersModel get paymentsTravelersModel => _paymentsTravelersModel!;
  AddPassportNumIntoReadyTravelingModel? _addPassportNumIntoReadyTravelingModel;
  AddPassportNumIntoReadyTravelingModel get addPassportNumIntoReadyTravelingModel => _addPassportNumIntoReadyTravelingModel!;
  ResponseModel? _cancelConfirmReservationModel;
  ResponseModel get cancelConfirmReservationModel => _cancelConfirmReservationModel!;
  GetAllConfirmedReservationsModel? _getAllConfirmedReservationsModel;
  GetAllConfirmedReservationsModel get getAllConfirmedReservationsModel => _getAllConfirmedReservationsModel!;
  TextEditingController passport_numController = TextEditingController();
  TextEditingController passport_numJourneyController = TextEditingController();

  RxInt index = 0.obs;
  RxInt travel = 2.obs;
  RxInt travelJourney = 2.obs;

  RxBool openJourney = false.obs;
  RxBool openJourneyLoading = false.obs;
  RxBool startJourney = false.obs;
  RxBool PaymentsTravelersLoading = false.obs;
  RxBool StartJourneyLoading = false.obs;
  RxBool DriverProfileLoading = false.obs;
  RxBool createJourneyLoading = false.obs;
  RxBool cancelConfirmReservationLoading = false.obs;
  RxBool getAllConfirmedReservationsLoading = false.obs;
  RxBool addPassportNumLoading = false.obs;
  changeIndex(int i) {
    index.value = i;
    update();
  }

  changeBookingType(int i) {
    travel.value = i;
    update();
  }
  changeJourneyType(int i) {
    travelJourney.value = i;
    update();
  }



  void createJourney({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else if (passport_numJourneyController.text.isEmpty) {
      Helper.showSnackBar(context,
          text: 'Passport_number_is_required'.tr, error: true);
    } else if (travelJourney.value==2) {
      Helper.showSnackBar(context,
          text: 'Booking_type'.tr, error: true);
    } else {
      createJourneyLoading.value = true;
      update();
      _driverRepository
          .createJourneyApi(
              context: context,
              passport_num: passport_numJourneyController.text,
              travel: travelJourney.value)
          .then((value) {
        if (value != null) {
          _createJourneyModel = CreateJourneyModel.fromJson(value.data);
          if (_createJourneyModel?.code == 200) {
            createJourneyLoading.value = false;
            print('successfully createJourney ');
            update();
          }
          else if(_createJourneyModel?.code == 400){
            openJourney.value=true;
            openJourneyDriver(int.parse(_createJourneyModel!.data!.currentJurneyCar!.first.jurneyNum!) );
            createJourneyLoading.value = false;
            print('no createJourney code 400');
            Helper.showSnackBar(context, text: _createJourneyModel?.message??"", error: false);
            update();
          }
          else {
            createJourneyLoading.value = false;
            print('error addReservations');
            Helper.showSnackBar(context, text: _createJourneyModel?.message??"", error: true);
            update();
          }
        }
      });
    }
  }

  void addPassportNumIntoReadyTraveling({required BuildContext context}) async {
    if (AppController.to.isInternet.value == false) {
      Get.snackbar('no_internet'.tr, 'There_no_internet_connection'.tr);
    } else if (passport_numController.text.isEmpty) {
      Helper.showSnackBar(context,
          text: 'Passport_number_is_required'.tr, error: true);
    } else if (travelJourney.value==2) {
      Helper.showSnackBar(context,
          text: 'Booking_type'.tr, error: true);
    } else {
      addPassportNumLoading.value = true;
      update();
      _driverRepository
          .addPassportNumIntoReadyTravelingApi(
              context: context,
              passport_num: passport_numController.text,
              travel: travel.value)
          .then((value) {
        if (value != null) {
          _addPassportNumIntoReadyTravelingModel = AddPassportNumIntoReadyTravelingModel.fromJson(value.data);
          if (_addPassportNumIntoReadyTravelingModel?.code == 200) {
            addPassportNumLoading.value = false;
            print('successfully createJourney ');
            update();
          }
          else {
            addPassportNumLoading.value = false;
            print('error addReservations');
            Helper.showSnackBar(context, text: _addPassportNumIntoReadyTravelingModel?.message??"", error: true);
            update();
          }
        }
      });
    }
  }

  void openJourneyDriver(int JourneyNum) async {
    print('start openJourneyDriver');
    openJourneyLoading.value = true;
    update();
    _driverRepository.openJourneyApi(JourneyNum).then((value) {
      if (value != null) {
        _openJourneyModel = OpenJourneyModel.fromJson(value.data);
        if (_openJourneyModel?.code == 200) {
          openJourneyLoading.value = false;
          print('successfully openJourneyDriver');
          print('successfully openJourneyDriver    ${value.data}');
          update();
        } else {
          openJourneyLoading.value = false;
          update();
        }
      }
    });
  }

  void getAllConfirmedReservations() async {
    print('start getAllConfirmedReservations');
    getAllConfirmedReservationsLoading.value = true;
    update();
    _driverRepository.getAllConfirmedReservationsApi().then((value) {
      if (value != null) {
        _getAllConfirmedReservationsModel = GetAllConfirmedReservationsModel.fromJson(value.data);
        if (_getAllConfirmedReservationsModel?.code == 200) {
          getAllConfirmedReservationsLoading.value = false;
          print('successfully getAllConfirmedReservations');
          print('successfully getAllConfirmedReservations    ${_getAllConfirmedReservationsModel?.data?.loading}');
          update();
        } else {
          getAllConfirmedReservationsLoading.value = false;
          update();
        }
      }
    });
  }

  void PaymentsTravelers() async {
    PaymentsTravelersLoading.value = true;
    update();
    _driverRepository.paymentsTravelersApi().then((value) {
      if (value != null) {
        _paymentsTravelersModel = PaymentsTravelersModel.fromJson(value.data);
        if (_paymentsTravelersModel?.code == 200) {
          PaymentsTravelersLoading.value = false;
          print('successfully PaymentsTravelers');
          print('successfully PaymentsTravelers    ${value.data}');
          update();
        } else {
          PaymentsTravelersLoading.value = false;
          update();
        }
      }
    });
  }

  void StartJourney(BuildContext context) async {
    StartJourneyLoading.value = true;
    update();
    _driverRepository.startJourneyApi().then((value) {
      if (value != null) {
        _startJourneyModel = StartJourneyModel.fromJson(value.data);
        if (_startJourneyModel?.code == 200) {
          StartJourneyLoading.value = false;
          startJourney.value = true;
          print('successfully StartJourney');
          print('successfully StartJourney    ${value.data}');
          update();
        } else {
          StartJourneyLoading.value = false;
          Helper.showSnackBar(context, text: _startJourneyModel?.message??"", error: true);
          update();
        }
      }
    });
  }


  void showProfileDriver() async {
    DriverProfileLoading.value = true;
    update();
    _driverRepository.showProfileApi().then((value) {
      if (value != null) {
        _driverProfile = DriverProfile.fromJson(value.data);
        print('successfully showProfileDriver ${value.data}');
        if (_driverProfile?.status == 200) {
          DriverProfileLoading.value = false;
          print('successfully showProfileDriver');
          update();
        } else {
          DriverProfileLoading.value = false;
          update();
        }
      }
    });
  }

  void cancelConfirmReservation(BuildContext context, int id, int num) async {
    cancelConfirmReservationLoading.value = true;
    update();
    _driverRepository.cancelConfirmReservationApi(id, num).then((value) {
      if (value != null) {
        _cancelConfirmReservationModel = ResponseModel.fromJson(value.data);
        print('cancelConfirmReservation get ${value.data}');
        if (_cancelConfirmReservationModel?.code == 200) {
          cancelConfirmReservationLoading.value = false;
          print('successfully cancelConfirmReservation');
          update();
        } else {
          cancelConfirmReservationLoading.value = false;
          Helper.showSnackBar(context,
              text: _cancelConfirmReservationModel?.message ?? '', error: true);
          update();
        }
      }
    });
  }

}
