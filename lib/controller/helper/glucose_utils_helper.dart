import 'package:bloodglucose_monitoring_flutterapp/model/glucose.dart';

class GlucoseUtilsHelper {
  static final shared = GlucoseUtilsHelper();

  //returns the smallest element in _glucoseList with the smallest element.value
  Glucose calculateMinimumGlucoseValue(List<Glucose> _glucoseList) {
    return _glucoseList.reduce((elementA, elementB) =>
        elementA.value < elementB.value ? elementA : elementB);
  }

  //returns the largest element in _glucoseList with the smallest element.value
  Glucose calculateMaximumGlucoseValue(List<Glucose> _glucoseList) {
    return _glucoseList.reduce((elementA, elementB) =>
        elementA.value > elementB.value ? elementA : elementB);
  }

  //returns the average of element.value in the _glucoseList
  double calculateAverageGlucoseValue(List<Glucose> _glucoseList) {
    int _lengthOfGlucoseList = _glucoseList.length;
    double _sumOfGlucoseValues =
        _glucoseList.fold(0, (sum, element) => sum + element.value);

    double _averageValue = double.parse(
        (_sumOfGlucoseValues / _lengthOfGlucoseList).toStringAsFixed(1));

    return _averageValue;
  }

  //returns the median of element.value in the _glucoseList
  double calculateMedianGlucoseValue(List<Glucose> _glucoseList) {
    List<double> _sortedList =
        _glucoseList.map((element) => element.value).toList();

    _sortedList.sort((a, b) => a.compareTo(b));

    int _middle = _sortedList.length ~/ 2;
    double _medianValue = (_sortedList.length % 2 == 1)
        ? _sortedList[_middle]
        : ((_sortedList[_middle - 1] + _sortedList[_middle]) / 2.0);

    return _medianValue;
  }
}
