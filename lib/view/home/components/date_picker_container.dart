import 'package:bloodglucose_monitoring_flutterapp/controller/glucose_controller.dart';
import 'package:flutter/material.dart';

import 'package:bloodglucose_monitoring_flutterapp/view/home/components/custom_date_picker.dart';
import 'package:get/get.dart';

class DatePickerContainer extends StatelessWidget {
  final GlucoseController _glucoseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomDatePicker(
              label: 'Pick Start Date',
              onConfirm: (date) =>
                  _glucoseController.setFilteredStartDate(date),
              currentTime: _glucoseController.getFilteredStartDate[0],
            ),
            CustomDatePicker(
              label: 'Pick End Date',
              onConfirm: (date) => _glucoseController.setFilteredEndDate(
                  date.add(Duration(
                      hours: 23, minutes: 59, seconds: 59, milliseconds: 999))),
              currentTime: _glucoseController.getFilteredEndDate[0],
            ),
          ],
        ));
  }
}
