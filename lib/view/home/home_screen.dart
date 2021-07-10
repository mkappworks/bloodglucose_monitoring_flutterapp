import 'package:flutter/material.dart';

import 'package:bloodglucose_monitoring_flutterapp/utils/constants.dart';

import 'package:bloodglucose_monitoring_flutterapp/view/home/components/home_body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Blood Glucose Monitoring App'),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: kAppBarDecoration),
        ),
      ),
      body: HomeBody(),
    );
  }
}
