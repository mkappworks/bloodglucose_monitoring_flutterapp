import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:bloodglucose_monitoring_flutterapp/utils/constants.dart';

import 'package:bloodglucose_monitoring_flutterapp/view/home/components/custom_text_icon_button.dart';

class CustomDatePicker extends StatelessWidget {
  final String label;
  final Function(DateTime date) onConfirm;
  final DateTime currentTime;

  const CustomDatePicker({
    required this.label,
    required this.onConfirm,
    required this.currentTime,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final scaleWidth = width / kMockupWidth;

    return CustomTextIconButton(
      onPressed: () {
        DatePicker.showDatePicker(
          context,
          showTitleActions: true,
          minTime: DateTime.now().subtract(Duration(days: 3650)),
          maxTime: DateTime.now(),
          onConfirm: onConfirm,
          currentTime: currentTime,
          locale: LocaleType.en,
          theme: DatePickerTheme(
            headerColor: kDatePickerColor,
            backgroundColor: kDatePickerColor,
            itemStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18 * scaleWidth),
            cancelStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16 * scaleWidth),
            doneStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16 * scaleWidth),
          ),
        );
      },
      icon: Icons.date_range_rounded,
      label: label,
    );
  }
}
