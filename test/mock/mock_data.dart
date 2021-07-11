import 'package:bloodglucose_monitoring_flutterapp/model/glucose.dart';

List<Glucose> loadedResponse = [
  Glucose(
      value: 2.5,
      timestamp: DateTime.parse("2021-02-10T10:25:00"),
      unit: "mmol/L"),
  Glucose(
      value: 3.5,
      timestamp: DateTime.parse("2021-02-10T11:25:00"),
      unit: "mmol/L")
];

List<Glucose> emptyResponse = [];

