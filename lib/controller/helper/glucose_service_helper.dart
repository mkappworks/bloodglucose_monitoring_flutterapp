import 'package:http/http.dart' as http;

import 'package:bloodglucose_monitoring_flutterapp/model/glucose.dart';
import 'package:bloodglucose_monitoring_flutterapp/model/blood_glucose_sample.dart';

class GlucoseServiceHelper {
  static final shared = GlucoseServiceHelper();

  // Fetch the raw blood glucose values from the following URL https://s3-de-central.profitbricks.com/una-health-frontend-tech-challenge/sample.json
  Future<List<Glucose>> fetchGlucoseList() async {
    try {
      //fetch data from external api
      final response = await http.get(Uri.parse(
          'https://s3-de-central.profitbricks.com/una-health-frontend-tech-challenge/sample.json'));

      // If the server did return a 200 OK response, then parse the JSON.
      if (response.statusCode == 200) {
        //Map the response body into List of Glucose objects
        List<Glucose> _responseGlucoseList =
            bloodGlucoseSampleFromJson(response.body).bloodGlucoseSamples;

        //filter the Glucose objects with Glucose.unit value of "mmol/L" and return this list
        List<Glucose> _filterGlucoseList = _responseGlucoseList
            .where((element) => element.unit == "mmol/L")
            .toList();

        return _filterGlucoseList;
      } else {
        // If the server did not return a 200 OK response, then throw an exception.
        throw Exception('Failed to load glucose list');
      }
    } catch (error) {
      print('Fetch Glucose List trycatch error $error');
      return <Glucose>[];
    }
  }

  //Post filtered glucose values
  Future<void> postGlucoseJson(List<Glucose> glucoseList) async {
    var _jsonBody = bloodGlucoseSampleToJson(
        BloodGlucoseSample(bloodGlucoseSamples: glucoseList));

    try {
      http.post(
        Uri.parse('https://jsonplaceholder.com/'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: _jsonBody,
      );
    } catch (error) {
      print('Post Glucose Json trycatch error $error');
    }
  }  
}
