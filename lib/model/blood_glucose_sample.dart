import 'dart:convert';

import 'package:bloodglucose_monitoring_flutterapp/model/glucose.dart';

BloodGlucoseSample bloodGlucoseSampleFromJson(String str) =>
    BloodGlucoseSample.fromJson(json.decode(str));

String bloodGlucoseSampleToJson(BloodGlucoseSample data) =>
    json.encode(data.toJson());

class BloodGlucoseSample {
  final List<Glucose> bloodGlucoseSamples;

  BloodGlucoseSample({
    required this.bloodGlucoseSamples,
  });

  factory BloodGlucoseSample.fromJson(Map<String, dynamic> json) =>
      BloodGlucoseSample(
        bloodGlucoseSamples: List<Glucose>.from(
          json["bloodGlucoseSamples"].map(
            (value) => Glucose.fromJson(value),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "bloodGlucoseSamples":
            List<dynamic>.from(bloodGlucoseSamples.map((value) => value.toJson())),
      };
}
