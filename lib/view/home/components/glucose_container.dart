import 'package:flutter/material.dart';

import 'package:bloodglucose_monitoring_flutterapp/utils/sized_box_functions.dart';

import 'package:bloodglucose_monitoring_flutterapp/view/home/components/glucose_line_chart.dart';
import 'package:bloodglucose_monitoring_flutterapp/view/home/components/export_button.dart';
import 'package:bloodglucose_monitoring_flutterapp/view/home/components/parameter_container.dart';
import 'package:bloodglucose_monitoring_flutterapp/view/home/components/date_picker_container.dart';

import 'package:bloodglucose_monitoring_flutterapp/utils/constants.dart';

class GlucoseContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final scaleHeigth = height / kMockupHeight;
    final scaleWidth = width / kMockupWidth;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 5.0 * scaleWidth, vertical: 5.0 * scaleHeigth),
      child: Column(
        children: [
          addVerticalSpace(10.0 * scaleHeigth),
          DatePickerContainer(),
          addVerticalSpace(10.0 * scaleHeigth),
          GlucoseLineChart(),
          addVerticalSpace(10.0 * scaleHeigth),
          ParameterContainer(),
          addVerticalSpace(30.0 * scaleHeigth),
          ExportButton(),
        ],
      ),
    );
  }
}
