import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bloodglucose_monitoring_flutterapp/controller/glucose_controller.dart';

import 'package:bloodglucose_monitoring_flutterapp/view/home/components/custom_text_icon_button.dart';

class ExportButton extends StatelessWidget {
  final GlucoseController _glucoseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomTextIconButton(
      onPressed: () => _glucoseController.saveGlucoseData(),
      icon: Icons.upload_file_rounded,
      label: 'Export Data',
      scale: 1.50,
    );
  }
}
