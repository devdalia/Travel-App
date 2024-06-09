import 'dart:async';

import 'package:amwaj_car/controllers/AppController.dart';
import 'package:amwaj_car/utilities/const.dart';
import 'package:amwaj_car/widget/custom_container_box_shadow.dart';
import 'package:amwaj_car/widget/custom_text_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_container_topshadow_to_bottom_widget.dart';

class MapNavScreen extends StatefulWidget {
  @override
  _MapNavScreenState createState() => _MapNavScreenState();
}

class _MapNavScreenState extends State<MapNavScreen> {
  final Completer<GoogleMapController> _mapController = Completer();
  final Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  String latitude = "";
  String longitude = "";
  String newLat = "";
  String newLog = "";
  int _markerIdCounter = 0;
  DateTime now = DateTime.now();
  String? time;
  DateTime? _dateTime;

  @override
  void initState() {
    getUserLocation();
    _getDateTime();
    super.initState();
  }

  _getDateTime() {
    setState(() {
      _dateTime = DateTime.now();
      time = DateFormat(' hh : mm : ss').format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return latitude.isEmpty || longitude.isEmpty
        ? Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kMainColor)))
        :   GetBuilder<AppController>(
            init: AppController(),
            builder: (AppController controller) {
              return Stack(
                children: [
                  GoogleMap(
                    markers: Set<Marker>.of(_markers.values),
                    onMapCreated: _onMapCreated,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                          double.parse(latitude), double.parse(longitude)),
                      zoom: 12.0,
                    ),
                    onCameraMove: (CameraPosition position) {
                      if (_markers.length > 0) {
                        MarkerId markerId = MarkerId(_markerIdVal());
                        Marker? marker = _markers[markerId];
                        Marker updatedMarker = marker!.copyWith(
                          positionParam: position.target,
                        );
                        setState(() {
                          _markers[markerId] = updatedMarker;
                        });
                      }
                    },
                    gestureRecognizers: Set()
                      ..add(Factory<EagerGestureRecognizer>(
                          () => EagerGestureRecognizer())),
                  ),
                  Positioned(
                    top: 15.h,
                    child: Column(
                      children: [
                        Container(
                          width: 40.w,
                          margin: EdgeInsets.only(
                              left: 20, right: 20, bottom: 3, top: 25),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0.2, 0.2),
                                  blurRadius: 5,
                                  color: Theme.of(context).shadowColor),
                            ],
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff000000).withOpacity(.30),
                                  Color(0xff858282).withOpacity(.30),
                                ]),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              buildRow('YUSUF HAFez', 'assets/images/user-color.png'),
                              buildRow('5059158', 'assets/images/card.png'),
                              buildRow('trip_driver'.tr, 'assets/images/seat.png'),
                            ],
                          ),
                        ),
                        SizedBox(height: 1.5.h),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 4.h,
                    left: 4.w,
                    child: Column(
                      children: [
                        CustomContainerBoxShadow(
                            width: 30.w,
                            radius: 10,
                            padding: EdgeInsets.only(bottom: 2, top: 2),
                            widgetContainer: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomTextWidget(
                                    title: '2',
                                    size: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.red),
                                Container(
                                  height: 4.h,
                                  width: 1.2,
                                  color: Theme.of(context).accentColor,
                                ),
                                CustomTextWidget(
                                    title: 'not_paid'.tr,
                                    size: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.red),
                              ],
                            )),
                        SizedBox(height: 1.h),
                        CustomContainerTopShadowToBottom(
                            height: 11.h,
                            width: 30.w,
                            title: '02:30:04'.tr,
                            text: false,
                            description: 'Trip_End'.tr,
                            textColor: Colors.white,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            listColor: [
                              Color(0xffDD7C7C).withOpacity(.50),
                              Color(0xffFF0000).withOpacity(.50),
                            ])
                      ],
                    ),
                  ),
                ],
              );
            },
          );
  }

  Row buildRow(String title, String image) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomTextWidget(
          title: title,
          size: 13,
          fontWeight: FontWeight.w500,
          color: Color(0xffF7FF00),
        ),
        SizedBox(width: 5.w),
        Image.asset(
          image,
          fit: BoxFit.contain,
          width: 20,
          height: 20,
        ),

        ///
      ],
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    LatLng INITIAL_LOCATION =
        LatLng(double.parse(latitude), double.parse(longitude));
    _mapController.complete(controller);
    if (INITIAL_LOCATION != null) {
      MarkerId markerId = MarkerId(_markerIdVal());
      LatLng position = INITIAL_LOCATION;
      Marker marker =
          Marker(markerId: markerId, position: position, draggable: false);
      setState(() {
        _markers[markerId] = marker;
      });

      Future.delayed(const Duration(seconds: 1), () async {
        GoogleMapController controller = await _mapController.future;
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: position,
              zoom: 17.0,
            ),
          ),
        );
      });
    }
  }

  String _markerIdVal({bool increment = false}) {
    String val = 'marker_id_$_markerIdCounter';
    if (increment) _markerIdCounter++;
    return val;
  }

  getUserLocation() async {
    final position = await Geolocator.getCurrentPosition();
    setState(() {
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();
    });



  }


}
