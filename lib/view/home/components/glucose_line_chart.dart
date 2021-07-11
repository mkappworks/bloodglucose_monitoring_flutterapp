import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:bloodglucose_monitoring_flutterapp/controller/glucose_controller.dart';

import 'package:bloodglucose_monitoring_flutterapp/model/glucose.dart';

import 'package:bloodglucose_monitoring_flutterapp/utils/constants.dart';

class GlucoseLineChart extends StatelessWidget {
  final GlucoseController _glucoseController = Get.find();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final scaleHeigth = height / kMockupHeight;
    final scaleWidth = width / kMockupWidth;

    return Obx(
      () => Container(
        height: 500.0 * scaleHeigth,
        child: SfCartesianChart(
          // Initialize X axis
          primaryXAxis: DateTimeCategoryAxis(
            title: AxisTitle(
                text: 'Time', textStyle: TextStyle(fontSize: 14 * scaleWidth)),
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            minimum: _glucoseController.getFilteredStartDate[0],
            maximum: _glucoseController.getFilteredEndDate[0],
          ),
          // Initialize Y axis
          primaryYAxis: NumericAxis(
            title: AxisTitle(
                text: 'Blood Glucose Level/mmol/L',
                textStyle: TextStyle(fontSize: 14 * scaleWidth)),
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            minimum: _glucoseController.getMinimumGlucoseValue[0].value - 1,
            maximum: _glucoseController.getMaximumGlucoseValue[0].value + 1,
          ),
          series: <LineSeries<Glucose, dynamic>>[
            // Bind all raw blood glucose data from list returned from _glucoseController.getGlucoseList()
            LineSeries<Glucose, dynamic>(
              dataSource: <Glucose>[
                ..._glucoseController.getDateFilteredGlucoseList
              ],
              xValueMapper: (Glucose glucose, _) => glucose.timestamp,
              yValueMapper: (Glucose glucose, _) => glucose.value,
            ),
            // Bind all the raw blood glucose data point with the minimum glucose value from list returned from _glucoseController.getMinimumGlucoseValue
            LineSeries<Glucose, dynamic>(
              dataSource: <Glucose>[
                ..._glucoseController.getMinimumGlucoseValue
              ],
              xValueMapper: (Glucose glucose, _) => glucose.timestamp,
              yValueMapper: (Glucose glucose, _) => glucose.value,
              // Renders the marker
              markerSettings: MarkerSettings(
                isVisible:
                    _glucoseController.getIsMinimumGlucoseValueHover.value,
                color: Colors.green,
                borderColor: Colors.green,
              ),
            ),
            // Bind all the raw blood glucose data point with the maximum glucose value from list returned from _glucoseController.getMaximumGlucoseValue
            LineSeries<Glucose, dynamic>(
              dataSource: <Glucose>[
                ..._glucoseController.getMaximumGlucoseValue
              ],
              xValueMapper: (Glucose glucose, _) => glucose.timestamp,
              yValueMapper: (Glucose glucose, _) => glucose.value,
              // Renders the marker
              markerSettings: MarkerSettings(
                isVisible:
                    _glucoseController.getIsMaximumGlucoseValueHover.value,
                color: Colors.red,
                borderColor: Colors.red,
                shape: DataMarkerType.triangle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
