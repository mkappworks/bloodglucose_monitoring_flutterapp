import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:bloodglucose_monitoring_flutterapp/controller/glucose_controller.dart';

import 'package:bloodglucose_monitoring_flutterapp/view/home/components/custom_text_icon_button.dart';

import 'package:bloodglucose_monitoring_flutterapp/utils/constants.dart';

class SetThresholdButton extends StatelessWidget {
  final GlucoseController _glucoseController = Get.find();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final scaleHeigth = height / kMockupHeight;
    final scaleWidth = width / kMockupWidth;

    return Obx(() => CustomTextIconButton(
          onPressed: () async {
            Get.defaultDialog(
              title: 'Enter Threshold',
              titleStyle: Theme.of(context).textTheme.headline2,
              content: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 35.0 * scaleWidth,
                    vertical: 5.0 * scaleHeigth,
                  ),
                  child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.numberWithOptions(
                        signed: true,
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*$')),
                      ],
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          _glucoseController.setThreshold(double.parse(value));
                          Get.back();
                        }
                      }),
                ),
              ),
            );
          },
          icon: Icons.add,
          label: _glucoseController.getThresholdPercentage.isEmpty
              ? 'Set Thresold'
              : 'Threshold Percentage : ${_glucoseController.getThresholdPercentage[0]}',
          scale: 1.50,
        ));
  }
}
