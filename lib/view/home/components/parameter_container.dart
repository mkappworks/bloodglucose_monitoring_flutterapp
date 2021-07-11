import 'package:bloodglucose_monitoring_flutterapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bloodglucose_monitoring_flutterapp/controller/glucose_controller.dart';

import 'package:bloodglucose_monitoring_flutterapp/utils/sized_box_functions.dart';

import 'package:bloodglucose_monitoring_flutterapp/view/home/components/parameter_card.dart';
import 'package:bloodglucose_monitoring_flutterapp/view/home/components/parameter_gesture_card.dart';

class ParameterContainer extends StatelessWidget {
  final GlucoseController _glucoseController = Get.find();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final scaleHeigth = height / kMockupHeight;

    return Obx(
      () => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ParameterGestureCard(
                onLongPressFn: () =>
                    _glucoseController.setIsMaximumGlucoseValueHover(),
                onLongPressEndFn: (details) =>
                    _glucoseController.setIsMaximumGlucoseValueHover(),
                label:
                    'Maximum : ${_glucoseController.getMaximumGlucoseValue[0].value}',
              ),
              ParameterGestureCard(
                  onLongPressFn: () =>
                      _glucoseController.setIsMinimumGlucoseValueHover(),
                  onLongPressEndFn: (details) =>
                      _glucoseController.setIsMinimumGlucoseValueHover(),
                  label:
                      'Minimum : ${_glucoseController.getMinimumGlucoseValue[0].value}'),
            ],
          ),
          addVerticalSpace(10.0 * scaleHeigth),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ParameterCard(
                label:
                    'Average : ${_glucoseController.getAverageGlucoseValue[0]}',
              ),
              ParameterCard(
                label:
                    'Median : ${_glucoseController.getMedianGlucoseValue[0]}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
