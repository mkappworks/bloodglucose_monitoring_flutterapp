import 'dart:convert';

List<Glucose> glucoseFromJson(String str) =>
    List<Glucose>.from(json.decode(str).map((x) => Glucose.fromJson(x)));

String glucoseToJson(List<Glucose> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Glucose {
  final String value;
  final DateTime timestamp;
  final String unit;

  Glucose({
    required this.value,
    required this.timestamp,
    required this.unit,
  });

  factory Glucose.fromJson(Map<String, dynamic> json) => Glucose(
        value: json["value"],
        timestamp: DateTime.parse(json["timestamp"]),
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "timestamp": timestamp.toIso8601String(),
        "unit": unit,
      };
}