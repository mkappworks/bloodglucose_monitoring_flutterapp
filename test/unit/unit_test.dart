import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:bloodglucose_monitoring_flutterapp/controller/helper/glucose_service_helper.dart';

import 'package:bloodglucose_monitoring_flutterapp/model/glucose.dart';

import 'unit_test.mocks.dart';

List<Glucose> response = [
  Glucose(
      value: 2.5,
      timestamp: DateTime.parse("2021-02-10T10:25:00"),
      unit: "mmol/L"),
  Glucose(
      value: 3.5,
      timestamp: DateTime.parse("2021-02-10T11:25:00"),
      unit: "mmol/L")
];

@GenerateMocks([GlucoseServiceHelper])
void main() {
  testWidgets(
      'Given response is not empty after calling fetchGlucoseList then should return List<Glucose> ',
      (WidgetTester tester) async {
    final client = MockGlucoseServiceHelper();

    var futureResponseData = Future.value(response);

    when(client.fetchGlucoseList())
        .thenAnswer((realInvocation) => futureResponseData);

    expect(client.fetchGlucoseList(), futureResponseData);
  });

  testWidgets(
      'Given response is empty after calling fetchGlucoseList then return empty list ',
      (WidgetTester tester) async {
    final client = MockGlucoseServiceHelper();

    var futureResponseData = Future.value(<Glucose>[]);

    when(client.fetchGlucoseList())
        .thenAnswer((realInvocation) => futureResponseData);

    expect(client.fetchGlucoseList(), futureResponseData);
  });
}
