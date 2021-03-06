import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bloodglucose_monitoring_flutterapp/controller/glucose_controller.dart';

import 'package:bloodglucose_monitoring_flutterapp/view/home/components/parameter_card.dart';
import 'package:bloodglucose_monitoring_flutterapp/view/home/components/parameter_gesture_card.dart';

/*
Render 04 cards with glucose parameter: 
Max: Maximum Glucose value -> This card can be longPressed to show red Triangle on line graph
Min: Minimum Glucose value -> This card can be longPressed to show green circle on line graph
Avg: Average Glucose value
Max: Median Glucose value
*/

class ParameterContainer extends StatelessWidget {
  final GlucoseController _glucoseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ParameterGestureCard(
                onLongPressFn: () =>
                    _glucoseController.setIsMaximumGlucoseValueHover(),
                onLongPressEndFn: (details) =>
                    _glucoseController.setIsMaximumGlucoseValueHover(),
                label: 'Max',
                value: '${_glucoseController.getMaximumGlucoseValue[0].value}',
              ),
              ParameterGestureCard(
                onLongPressFn: () =>
                    _glucoseController.setIsMinimumGlucoseValueHover(),
                onLongPressEndFn: (details) =>
                    _glucoseController.setIsMinimumGlucoseValueHover(),
                label: 'Min',
                value: '${_glucoseController.getMinimumGlucoseValue[0].value}',
              ),
              ParameterCard(
                label: 'Avg',
                value: '${_glucoseController.getAverageGlucoseValue[0]}',
              ),
              ParameterCard(
                label: 'Med',
                value: '${_glucoseController.getMedianGlucoseValue[0]}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
