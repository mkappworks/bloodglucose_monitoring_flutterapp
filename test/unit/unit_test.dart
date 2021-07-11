import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:bloodglucose_monitoring_flutterapp/controller/helper/glucose_service_helper.dart';

import '../mock/mock_data.dart';
import 'unit_test.mocks.dart';

@GenerateMocks([GlucoseServiceHelper])
void main() {
  testWidgets(
      'Given response is not empty after calling fetchGlucoseList then should return List<Glucose> ',
      (WidgetTester tester) async {
    final client = MockGlucoseServiceHelper();

    var futureResponseData = Future.value(loadedResponse);

    when(client.fetchGlucoseList())
        .thenAnswer((realInvocation) => futureResponseData);

    expect(client.fetchGlucoseList(), futureResponseData);
  });

  testWidgets(
      'Given response is empty after calling fetchGlucoseList then return empty list ',
      (WidgetTester tester) async {
    final client = MockGlucoseServiceHelper();

    var futureResponseData = Future.value(emptyResponse);

    when(client.fetchGlucoseList())
        .thenAnswer((realInvocation) => futureResponseData);

    expect(client.fetchGlucoseList(), futureResponseData);
  });
}
