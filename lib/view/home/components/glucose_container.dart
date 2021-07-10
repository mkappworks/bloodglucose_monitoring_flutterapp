import 'package:flutter/material.dart';

import 'package:bloodglucose_monitoring_flutterapp/utils/sized_box_functions.dart';

import 'package:bloodglucose_monitoring_flutterapp/view/home/components/glucose_line_chart.dart';
import 'package:bloodglucose_monitoring_flutterapp/view/home/components/custom_text_icon_button.dart';
import 'package:bloodglucose_monitoring_flutterapp/view/home/components/parameter_container.dart';
import 'package:bloodglucose_monitoring_flutterapp/view/home/components/date_picker_container.dart';

class GlucoseContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        addVerticalSpace(10.0),
        GlucoseLineChart(),
        addVerticalSpace(10.0),
        ParameterContainer(),
        addVerticalSpace(30.0),
        CustomTextIconButton(
          onPressed: () => {},
          icon: Icons.data_usage_rounded,
          label: 'Export Data',
        ),
      ],
    );
  }
}
