import 'dart:async';

import 'package:amwaj_car/Screen/driver/home_screen.dart';
import 'package:amwaj_car/controllers/Driver_controller.dart';
import 'package:amwaj_car/controllers/User_controller.dart';
import 'package:amwaj_car/helpers/binding.dart';
import 'package:amwaj_car/local_storage/shared_preferences/preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/AppController.dart';
import '../home_client/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    initConnectivity();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animationController!.repeat();

    super.initState();
  }

  stopRotation() {
    animationController!.stop();
  }

  startRotation() {
    animationController!.repeat();
  }

  @override
  void dispose() {
    stopRotation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff8051BC),
            Color(0xff95107F),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          Center(
            child: Image.asset('assets/images/logo.png'),
          ),
          Expanded(child: Container()),
          Text(
            'All_rights_reserved_2022'.tr,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    ));
  }

  goToIntroSlider() {
    Timer(const Duration(seconds: 3), navigationPage);
  }

  void navigationPage() {
    Get.put(AppController()).theme();
    if (HiveController().token != '') {
      AppController.to.login.value = 'yes';
      if(HiveController().type == 'driver'){
        DriverController.to.showProfileDriver();
        DriverController.to.getAllConfirmedReservations();
        Get.offAll(HomeDriverScreen(), binding: Binding());
      }else {

      UserController.to.showProfileUser();
      UserController.to.getTypeReservations();
      UserController.to.getAllPaymentsRecord();
      UserController.to.getDocumentationUser();
      ///UserController.to.getRequestDocumentationUser();
      UserController.to.getReservationsClient();
      UserController.to.getMyReservations();
        Get.offAll(HomeScreen(), binding: Binding());
      }
      UserController.to.allDataWalletUser();
    } else if (HiveController().token == '') {
      AppController.to.changeIndex(4);
      Get.offAll(HomeScreen(), binding: Binding());
    }
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        AppController.to.checkInternet(true);
        goToIntroSlider();
        break;
      default:

        ///  Get.snackbar('لا يوجد انترنت', 'يرجى التأكد من الاتصال بالانترنت');
        showDialog<String>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => AlertDialog(
            scrollable: true,
            contentPadding: EdgeInsets.fromLTRB(8, 5, 8, 5),
            insetPadding: EdgeInsets.all(15),
            backgroundColor: Colors.grey.withOpacity(0.8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Column(
              children: [
                Text(
                  'Attention'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).iconTheme.color),
                ),
                Container(
                  height: 1.2,
                  width: double.infinity,
                  color: Colors.black,
                )
              ],
            ),
            content: InkWell(
              onTap: () {
                ////  Get.back();
                initConnectivity;
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 20,
                margin: EdgeInsets.only(top: 25, bottom: 15),
                child: Text(
                  'There_is_no_internet_connection_or_th_service_is_not_currently_available'
                      .tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).iconTheme.color),
                ),
              ),
            ),
          ),
        );
        AppController.to.checkInternet(false);
        break;
    }
  }
}
