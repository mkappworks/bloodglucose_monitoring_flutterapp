class Glucose {
  final int? id;
  final double value;
  final DateTime timestamp;
  final String unit;

  Glucose({
    this.id,
    required this.value,
    required this.timestamp,
    required this.unit,
  });

  factory Glucose.fromJson(Map<String, dynamic> json) => Glucose(
        value: double.parse(json["value"]),
        timestamp: DateTime.parse(json["timestamp"]),
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "value": value,
        "timestamp": timestamp.toIso8601String(),
        "unit": unit,
      };
}
