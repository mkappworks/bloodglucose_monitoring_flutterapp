import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bloodglucose_monitoring_flutterapp/controller/glucose_controller.dart';

import 'package:bloodglucose_monitoring_flutterapp/view/home/components/custom_text_icon_button.dart';

class SaveButton extends StatelessWidget {
  final GlucoseController _glucoseController = Get.find();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return CustomTextIconButton(
      onPressed: () async {
        await _glucoseController.saveGlucoseData();
        Get.snackbar(
          "Blood Glucose Monitoring",
          "Data Saved in Local Storage!",
          maxWidth: width * 0.7,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.grey.withOpacity(0.7),
          isDismissible: true,
          duration: Duration(milliseconds: 1200),
        );
      },
      icon: Icons.save_rounded,
      label: 'Save Data',
      scale: 1.50,
    );
  }
}
