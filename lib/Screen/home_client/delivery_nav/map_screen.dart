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
class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _mapController = Completer();
  final Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  String latitude = "";
  String longitude = "";
  String newLat = "";
  String newLog = "";
  int _markerIdCounter = 0;
  DateTime now = DateTime.now();
  String ?time;
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
      time=   DateFormat(' hh : mm : ss').format(now );
    });

  }
  @override
  Widget build(BuildContext context) {
    return latitude.isEmpty||longitude.isEmpty?
    Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(kMainColor))):
    GetX<AppController>(
        init: AppController() ,
        builder: (AppController controller){
          return  Stack(
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
                gestureRecognizers: Set()..add(Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer())),
              ),

              Positioned(
                top: 15.h,
                child: Column(
                  children: [
                    Container(
                      width: 40.w,
                      margin: EdgeInsets.only(left: 20,right: 20,bottom: 3,top: 25),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0.2, 0.2),
                              blurRadius: 5,
                              color:  Theme.of(context).shadowColor),
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors:   [
                              Color(0xff000000).withOpacity(.30),
                              Color(0xff858282).withOpacity(.30),
                            ]
                        ),
                      ),
                      child:   Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          buildRow('YUSUF HAFez','assets/images/user-color.png' ),

                          buildRow('5059158','assets/images/card.png'),

                          buildRow( 'VIP_seat'.tr,'assets/images/seat.png'),
                        ],
                      ),),
                    SizedBox(height: 1.5.h),

                    Column(
                      children: [
                        CustomContainerBoxShadow(
                          width: 40.w,

                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          colorFill: Colors.white.withOpacity(.32),
                          padding: EdgeInsets.only(bottom: 15,top: 10),
                          widgetContainer:   Center(
                            child: CustomTextWidget(
                                title:time,
                                size: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff0082C0)),
                          ),
                        ),
                        Container(
                          width: 40.w,
                          margin: EdgeInsets.only(left: 20,right: 20 ),
                          padding: EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            color:Theme.of(context).cardColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0.2, 0.2),
                                  blurRadius: 5,
                                  color:  Theme.of(context).shadowColor),
                            ],
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors:   [
                                  Color(0xff000000).withOpacity(.30),
                                  Color(0xff858282).withOpacity(.30),
                                ]
                            ),
                          ),
                          child: Column(
                            children: [

                              CustomTextWidget(
                                  title:'On_the_way_to'.tr ,
                                  size: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                              SizedBox(height: 1.h),
                              Container(
                                height: 1,
                                color: Colors.white,
                                width: double.infinity,
                              ),
                              SizedBox(height: 1.h),
                              CustomTextWidget(
                                title:'القاهــــــــــــرة' ,
                                size: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffF7FF00),

                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),

            ],
          );
        },

    );
  }
  Row buildRow(String title ,String image) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomTextWidget(
          title:title ,
          size: 13,
          fontWeight: FontWeight.w500,
          color: Color(0xffF7FF00),

        ),
        SizedBox(width: 5.w),
        Image.asset(image,fit: BoxFit.contain,width: 20,height:20 ,),
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
        _markers[markerId] = marker;});

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
