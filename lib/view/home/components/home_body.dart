import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bloodglucose_monitoring_flutterapp/controller/glucose_controller.dart';

import 'package:bloodglucose_monitoring_flutterapp/view/home/components/glucose_container.dart';

class HomeBody extends StatelessWidget {
  final GlucoseController _glucoseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      //depending on the status of the GlucoseController, respective widgets are rendered
      child: Obx(() {
        switch (_glucoseController.getStatus.value) {
          case GlucoseListStatus.empty:
            return Text("Empty");
          case GlucoseListStatus.loaded:
            return GlucoseContainer();
          case GlucoseListStatus.loading:
            return CircularProgressIndicator();
          default:
            return Container();
        }
      }),
    );
  }
}
