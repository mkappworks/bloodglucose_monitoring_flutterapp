import 'package:flutter/material.dart';

import 'package:bloodglucose_monitoring_flutterapp/utils/constants.dart';

import 'package:bloodglucose_monitoring_flutterapp/view/home/components/home_body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final scaleWidth = width / kMockupWidth;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Blood Glucose Monitoring App',
          textScaleFactor: scaleWidth,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kAppBarDecoration),
        ),
      ),
      body: HomeBody(),
    );
  }
}
