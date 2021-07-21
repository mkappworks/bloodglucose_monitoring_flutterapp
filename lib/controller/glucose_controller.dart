import 'package:bloodglucose_monitoring_flutterapp/db/database_helper.dart';
import 'package:get/get.dart';

import 'package:bloodglucose_monitoring_flutterapp/controller/helper/glucose_service_helper.dart';
import 'package:bloodglucose_monitoring_flutterapp/controller/helper/glucose_utils_helper.dart';
import 'package:bloodglucose_monitoring_flutterapp/controller/glucose_interface.dart';

import 'package:bloodglucose_monitoring_flutterapp/model/glucose.dart';

class GlucoseController extends GetxController implements GlucoseInterface {
  Rx<GlucoseListStatus> _status = GlucoseListStatus.loading.obs;
  RxList<Glucose> _apiGlucoseList = <Glucose>[].obs;

  RxList<DateTime> _filteredStartDate = <DateTime>[].obs;
  RxList<DateTime> _filteredEndDate = <DateTime>[].obs;

  RxList<Glucose> _dateFilteredGlucoseList = <Glucose>[].obs;

  RxList<Glucose> _minimumGlucoseValue = <Glucose>[].obs;
  RxList<Glucose> _maximumGlucoseValue = <Glucose>[].obs;
  RxList<double> _averageGlucoseValue = <double>[].obs;
  RxList<double> _medianGlucoseValue = <double>[].obs;

  RxBool _isMaximumGlucoseValueHover = false.obs;
  RxBool _isMinimumGlucoseValueHover = false.obs;

  RxList<double> _threshold = <double>[].obs;
  RxList<double> _thresholdPercentage = <double>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await setGlucoseList();
  }

  @override
  void dispose() async {
    await DatabaseHelper.shared.close();
    super.dispose();
  }

  //Function to get and set all raw glucose data external api
  @override
  Future<void> setGlucoseList() async {
    _status.value = GlucoseListStatus.loading;

    _apiGlucoseList
        .assignAll(await GlucoseServiceHelper.shared.fetchGlucoseList());

    if (_apiGlucoseList.isEmpty) {
      _status.value = GlucoseListStatus.empty;
    } else {
      setApiStartEndDate(_apiGlucoseList);
      _status.value = GlucoseListStatus.loaded;
    }

    update();
  }

  @override
  void setApiStartEndDate(List<Glucose> currentList) {
    //get the start date of _glucoseList
    setFilteredStartDate(GlucoseUtilsHelper.shared
        .getGlucoseListStartDate(currentList)
        .timestamp);

    //get the end date of _glucoseList
    setFilteredEndDate(
        GlucoseUtilsHelper.shared.getGlucoseListEndDate(currentList).timestamp);
  }

  @override
  void setFilteredStartDate(DateTime startDate) {
    //check whether the _filteredStartDate list is empty.
    //if empty assign startDate (this only happens when the app is loading for the first time)
    if (_filteredStartDate.length == 0) _filteredStartDate.assign(startDate);

    //if _filteredEndDate.length is not empty and startDate is less than the _filteredEndDate
    if (_filteredEndDate.length != 0 &&
        startDate.compareTo(_filteredEndDate[0]) <= 0)
      _filteredStartDate.assign(startDate);

    //if _filteredEndDate is not empty the _setDateFilteredGlucoseList fn is called
    if (_filteredEndDate.length != 0) setDateFilteredGlucoseList();

    update();
  }

  @override
  void setFilteredEndDate(DateTime endDate) {
    //check whether the _filteredEndDate list is empty.
    //if empty assign endDate (this only happens when the app is loading for the first time)
    if (_filteredEndDate.length == 0) _filteredEndDate.assign(endDate);

    //if _filteredStartDate.length is not empty and endDate is greater than the _filteredEndDate
    if (_filteredStartDate.length != 0 &&
        endDate.compareTo(_filteredStartDate[0]) >= 0)
      _filteredEndDate.assign(endDate);

    //if _filteredStartDate is not empty the _setDateFilteredGlucoseList fn is called
    if (_filteredStartDate.length != 0) setDateFilteredGlucoseList();

    update();
  }

  @override
  void setDateFilteredGlucoseList() {
    _dateFilteredGlucoseList.assignAll(
      GlucoseUtilsHelper.shared.getDateFilteredGlucoseList(
        apiGlucoseList: _apiGlucoseList,
        startDate: _filteredStartDate[0],
        endDate: _filteredEndDate[0],
      ),
    );

    if (_threshold.isNotEmpty) setThresholdPercentage();

    setGlucoseParameters(_dateFilteredGlucoseList);

    update();
  }

  //Function to calculate and set all max, min, average and median glucose value from _glucoseList
  @override
  void setGlucoseParameters(List<Glucose> currentList) {
    //get the maximum glucose value
    _maximumGlucoseValue
        .assign(GlucoseUtilsHelper.shared.getMaximumGlucoseValue(currentList));

    //get the minimum glucose value
    _minimumGlucoseValue
        .assign(GlucoseUtilsHelper.shared.getMinimumGlucoseValue(currentList));

    // calculating the average glucose value
    _averageGlucoseValue.assign(
        GlucoseUtilsHelper.shared.calculateAverageGlucoseValue(currentList));

    // calculating the median glucose value
    _medianGlucoseValue.assign(
        GlucoseUtilsHelper.shared.calculateMedianGlucoseValue(currentList));

    update();
  }

  //Function to set whether the Maximum Glucose Value is being long pressed
  @override
  void setIsMaximumGlucoseValueHover() {
    _isMaximumGlucoseValueHover.value = !_isMaximumGlucoseValueHover.value;

    update();
  }

  //Function to set whether the Minimum Glucose Value is being long pressed
  @override
  void setIsMinimumGlucoseValueHover() {
    _isMinimumGlucoseValueHover.value = !_isMinimumGlucoseValueHover.value;

    update();
  }

  @override
  Future<void> postGlucoseData() async => await GlucoseServiceHelper.shared
      .postGlucoseJson(_dateFilteredGlucoseList);

  @override
  Future<void> saveGlucoseData() async =>
      await DatabaseHelper.shared.insertAll(_dateFilteredGlucoseList);

  //Function to set the threshold value from ui to _threshold
  @override
  void setThreshold(double threshold) {
    _threshold.assign(threshold);

    setThresholdPercentage();

    update();
  }

  //Function to get the threshold percentage and set to _thresholdPercentage
  @override
  void setThresholdPercentage() {
    List _thresholdGlucoseList = _dateFilteredGlucoseList
        .where((item) => item.value < _threshold[0])
        .toList();

    int _thresholdGlucoseListCount = _thresholdGlucoseList.length;
    int _dateFilteredGlucoseListCount = _dateFilteredGlucoseList.length;

    double percentage =
        _thresholdGlucoseListCount * 100 / _dateFilteredGlucoseListCount;

    _thresholdPercentage.assign(percentage.toPrecision(1));

    update();
  }

  //get the current status of the GlucoseController
  @override
  Rx<GlucoseListStatus> get getStatus => _status;

  //get the startDate
  @override
  RxList<DateTime> get getFilteredStartDate => _filteredStartDate;

  //get the endDate
  @override
  RxList<DateTime> get getFilteredEndDate => _filteredEndDate;

  //get the date filtered _glucoseList
  @override
  RxList<Glucose> get getDateFilteredGlucoseList => _dateFilteredGlucoseList;

  //get the _minimumGlucoseValue
  @override
  RxList<Glucose> get getMinimumGlucoseValue => _minimumGlucoseValue;

  //get the _maximumGlucoseValue
  @override
  RxList<Glucose> get getMaximumGlucoseValue => _maximumGlucoseValue;

  //get the _averageGlucoseValue
  @override
  RxList<double> get getAverageGlucoseValue => _averageGlucoseValue;

  //get the _medianGlucoseValue
  @override
  RxList<double> get getMedianGlucoseValue => _medianGlucoseValue;

  //get the _isMaximumGlucoseValueHover
  @override
  RxBool get getIsMaximumGlucoseValueHover => _isMaximumGlucoseValueHover;

  //get the _isMinimumGlucoseValueHover
  @override
  RxBool get getIsMinimumGlucoseValueHover => _isMinimumGlucoseValueHover;

  //get the _thresholdPercentage
  @override
  RxList<double> get getThresholdPercentage => _thresholdPercentage;
}
