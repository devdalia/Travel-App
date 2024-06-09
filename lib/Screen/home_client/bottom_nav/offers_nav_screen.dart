import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

import '../../../widget/build_header_nav_widget.dart';
import '../details_offer_screen.dart';


class OffersNavScreen extends StatefulWidget {
  const OffersNavScreen({Key? key}) : super(key: key);

  @override
  State<OffersNavScreen> createState() => _OffersNavScreenState();
}

class _OffersNavScreenState extends State<OffersNavScreen> {
  ScrollController _scrollController = ScrollController();
  List<String> listImage=[
    'assets/images/offer-1.png',
    'assets/images/offer-1.png',
    'assets/images/offer-1.png',
    'assets/images/offer-2.png',
    'assets/images/offer-2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return BuildHeaderNavWidget(
      title: 'Offers'.tr,
      scrollPhysics: BouncingScrollPhysics(),
      widget: Container(
        height:  MediaQuery.of(context).size.height - 50,
        padding: EdgeInsets.only(left: 5),
        child: VsScrollbar(
          controller: _scrollController,
          showTrackOnHover: true, // default false
          isAlwaysShown: true, // default false
          scrollbarFadeDuration: Duration(
              milliseconds: 500), // default : Duration(milliseconds: 300)
          scrollbarTimeToFade: Duration(
              milliseconds: 800), // default : Duration(milliseconds: 600)
          style: VsScrollbarStyle(
            hoverThickness:12.0, // default 12.0
            radius: Radius.circular(30), // default Radius.circular(8.0)
            thickness: 5.0, // default 8.0
            color: Color(0xff810A93),   // default ColorScheme Theme
          ),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: listImage.length,
              physics: BouncingScrollPhysics(),
              controller: _scrollController,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: ()=>Get.to(DetailsOfferScreen()),
                  child: Container(
                      margin: EdgeInsets.only(
                          bottom: 15
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Image.asset(listImage[index],fit: BoxFit.contain,)),
                ) ;
              }),
        ),
      ),
    );
  }
}
