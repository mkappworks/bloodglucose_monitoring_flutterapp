import 'package:bloodglucose_monitoring_flutterapp/model/glucose.dart';

class GlucoseUtilsHelper {
  static final shared = GlucoseUtilsHelper();

  //returns the element in _glucoseList with the smallest element.value
  Glucose getMinimumGlucoseValue(List<Glucose> _glucoseList) {
    return _glucoseList.reduce((elementA, elementB) =>
        elementA.value < elementB.value ? elementA : elementB);
  }

  //returns the element in _glucoseList with the smallest element.value
  Glucose getMaximumGlucoseValue(List<Glucose> _glucoseList) {
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

  //returns the element in _glucoseList with the smallest element.timestamp
  Glucose getGlucoseListStartDate(List<Glucose> _glucoseList) {
    return _glucoseList.reduce((elementA, elementB) =>
        elementA.timestamp.compareTo(elementB.timestamp) < 0
            ? elementA
            : elementB);
  }

  //return the element in _glucoseList with the largest element.timestamp
  Glucose getGlucoseListEndDate(List<Glucose> _glucoseList) {
    return _glucoseList.reduce((elementA, elementB) =>
        elementA.timestamp.compareTo(elementB.timestamp) > 0
            ? elementA
            : elementB);
  }

  //return List<Glucose> with timeStamp between startDate and endDate
  List<Glucose> getDateFilteredGlucoseList({
    required List<Glucose> apiGlucoseList,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return apiGlucoseList
        .where((element) =>
            element.timestamp.compareTo(endDate) <= 0 &&
            element.timestamp.compareTo(startDate) >= 0)
        .toList();
  }

  //return percentage of which the glucose list values are below the threshold input by user
  double getThresholdPercentage(
      List<Glucose> dateFilteredGlucoseList, double threshold) {
        
    List _thresholdGlucoseList = dateFilteredGlucoseList
        .where((item) => item.value < threshold)
        .toList();

    int _thresholdGlucoseListCount = _thresholdGlucoseList.length;
    int _dateFilteredGlucoseListCount = dateFilteredGlucoseList.length;

    return _thresholdGlucoseListCount * 100 / _dateFilteredGlucoseListCount;
  }
}
