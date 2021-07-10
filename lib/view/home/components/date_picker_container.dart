import 'package:flutter/material.dart';

import 'package:bloodglucose_monitoring_flutterapp/view/home/components/custom_date_picker.dart';

class DatePickerContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomDatePicker(
          label: 'Pick Start Date',
          onConfirm: () => {},
        ),
        CustomDatePicker(
          label: 'Pick End Date',
          onConfirm: () => {},
        ),
      ],
    );
  }
}
