import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Global {
  Widget background(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE5315C), Color(0xFFFFFFFF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.7,
          ),
        ],
      ),
    );
  }

  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  final Color salmonPink = const Color(0xffff8f9c);
  final Color bitterSweet = const Color(0xffff6666);
  final Color eerieBlack = const Color(0xff212121);
  final Color sonicSilver = const Color(0xff787878);
  final Color spanishGray = const Color(0xff999999);
  final Color lowOpacityGray = const Color(0xFF6A6A6A);
  final Color onyx = const Color(0xff454545);
  final Color white = const Color(0xffffffff);
  final Color cultured = const Color(0xffededed);
  final Color davysGray = const Color(0xff545454);
  final Color oceanGreen = const Color(0xff46c389);
  final Color sandyBrown = const Color(0xfff6a355);

  double fixedSidePadding = 0.15;

  List<Map<String, dynamic>> menuBar = [
    {
      'name': "HOME",
      'pageRoutes': "",
      'key': GlobalKey(debugLabel: 'home'),
    },
    {
      'name': "MEN'S",
      'pageRoutes': "",
      'key': GlobalKey(debugLabel: 'mens'),
    },
    {
      'name': "WOMEN'S",
      'pageRoutes': "",
      'key': GlobalKey(debugLabel: 'womens'),
    },
  ];
}
