import 'package:amwaj_car/Screen/Register&Login/login_&_register_screen.dart';
import 'package:amwaj_car/Screen/home_client/bottom_nav/home_representative_nav_screen.dart';
import 'package:amwaj_car/controllers/User_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/AppController.dart';
import '../../local_storage/shared_preferences/preferences.dart';
import '../../widget/build_bottom_nav_icon.dart';
import '../../widget/toast_widget.dart';
import 'bottom_nav/home_nav_screen.dart';
import 'bottom_nav/more_nav_screen.dart';
import 'bottom_nav/offers_nav_screen.dart';
import 'bottom_nav/profile_nav_screen.dart';
import 'bottom_nav/trip_nav_screen.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? currentBackPressTime;

  @override
  void initState() {
    UserController.to.allDataWalletUser();
    UserController.to.showProfileUser();
    UserController.to.getDocumentationUser();
    UserController.to.getTypeReservations();
    UserController.to.getAllPaymentsRecord();
    UserController.to.getReservationsClient();
    UserController.to.getMyReservations();
    super.initState();
  }

  final List<String> icons = [
    'assets/images/more.png',
    'assets/images/user.png',
    'assets/images/offers.png',
    'assets/images/the-trip.png',
    'assets/images/search_fill.png',
  ];

  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(
      init: Get.put(AppController()),
      builder: (AppController controller) {
        final List<Widget> _buildScreens = [
          MoreNavScreen(),
          controller.login.value == 'no'
              ? LoginAndRegisterScreen()
              : ProfileNavScreen(),
          OffersNavScreen(),
              TripNavScreen(),
          controller.home.value == 'client'
              ? HomeNavScreen()
              : HomeRepresentativeNavScreen(),
        ];
        return WillPopScope(
          onWillPop: onWillPop,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: _buildScreens[controller.index.value],
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: BottomAppBar(
                child: Container(
                  height: 55,
                  padding: EdgeInsets.only(top: 3, bottom: 3),
                  margin: EdgeInsets.only(top: 3, bottom: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BuildBottomNavIcon(
                        label: 'Home'.tr,
                        icon: icons[4],
                        selected: controller.index.value == 4,
                        onClick: () {
                          controller.changeIndex(4);
                        },
                      ),
                      BuildBottomNavIcon(
                        label: 'the_trip'.tr,
                        icon: icons[3],
                        selected: controller.index.value == 3,
                        onClick: () {
                          if (HiveController().token != '')
                          controller.changeIndex(3);
                        },
                      ),
                      BuildBottomNavIcon(
                        label: 'Offers'.tr,
                        icon: icons[2],
                        selected: controller.index.value == 2,
                        onClick: () {
                          controller.changeIndex(2);
                        },
                      ),
                      BuildBottomNavIcon(
                        label: controller.login.value == 'no'
                            ? 'Login'.tr
                            : 'profile'.tr,
                        icon: icons[1],
                        selected: controller.index.value == 1,
                        onClick: () {
                          controller.changeIndex(1);
                          controller.type.value = 'login';
                        },
                      ),
                      BuildBottomNavIcon(
                        label: 'More'.tr,
                        icon: icons[0],
                        selected: controller.index.value == 0,
                        onClick: () {
                          if (HiveController().token != '')
                          controller.changeIndex(0);
                        },
                      ),
                    ],
                  ),
                ),
                shape: CircularNotchedRectangle(),
                elevation: 20.0,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Toast.show('Double click to exit', context, duration: 2);

      return Future.value(false);
    }
    return Future.value(true);
  }
}
