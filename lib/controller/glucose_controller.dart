import 'package:bloodglucose_monitoring_flutterapp/controller/helper/glucose_utils_helper.dart';
import 'package:get/get.dart';

import 'package:bloodglucose_monitoring_flutterapp/controller/helper/glucose_service_helper.dart';

import 'package:bloodglucose_monitoring_flutterapp/model/glucose.dart';

enum GlucoseListStatus { loading, loaded, empty }

class GlucoseController extends GetxController {
  Rx<GlucoseListStatus> _status = GlucoseListStatus.loading.obs;
  RxList<Glucose> _apiGlucoseList = <Glucose>[].obs;

  RxList<Glucose> _startDate = <Glucose>[].obs;
  RxList<Glucose> _endDate = <Glucose>[].obs;

  RxList<Glucose> _dateFilteredGlucoseList = <Glucose>[].obs;

  RxList<Glucose> _minimumGlucoseValue = <Glucose>[].obs;
  RxList<Glucose> _maximumGlucoseValue = <Glucose>[].obs;
  RxList<double> _averageGlucoseValue = <double>[].obs;
  RxList<double> _medianGlucoseValue = <double>[].obs;

  RxBool _isMaximumGlucoseValueHover = false.obs;
  RxBool _isMinimumGlucoseValueHover = false.obs;

  Future<void> onInit() async {
    super.onInit();
    await _setGlucoseList();
  }

  //Function to get and set all raw glucose data external api
  Future<void> _setGlucoseList() async {
    _status.value = GlucoseListStatus.loading;

    _apiGlucoseList
        .assignAll(await GlucoseServiceHelper.shared.fetchGlucoseList());

    if (_apiGlucoseList.isEmpty) {
      _status.value = GlucoseListStatus.empty;
    } else {
      setStartEndDate(_apiGlucoseList);
      _status.value = GlucoseListStatus.loaded;
    }

    update();
  }

  void setStartEndDate(List<Glucose> currentList) {
    //get the start date of _glucoseList
    _startDate
        .assign(GlucoseUtilsHelper.shared.getGlucoseListStartDate(currentList));

    //get the end date of _glucoseList
    _endDate
        .assign(GlucoseUtilsHelper.shared.getGlucoseListEndDate(currentList));

    setDateFilteredGlucoseList(
        startDate: _startDate[0].timestamp, endDate: _endDate[0].timestamp);
  }

  void setDateFilteredGlucoseList(
      {required DateTime startDate, required DateTime endDate}) {
    _dateFilteredGlucoseList.assignAll(GlucoseUtilsHelper.shared
        .getDateFilteredGlucoseList(
            apiGlucoseList: _apiGlucoseList,
            startDate: startDate,
            endDate: endDate));

    setGlucoseParameters(_dateFilteredGlucoseList);

    update();
  }

  //Function to calculate and set all max, min, average and median glucose value from _glucoseList
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
  void setIsMaximumGlucoseValueHover() =>
      _isMaximumGlucoseValueHover.value = !_isMaximumGlucoseValueHover.value;

  //Function to set whether the Minimum Glucose Value is being long pressed
  void setIsMinimumGlucoseValueHover() {
    _isMinimumGlucoseValueHover.value = !_isMinimumGlucoseValueHover.value;
  }

  //get the current status of the GlucoseController
  Rx<GlucoseListStatus> get getStatus => _status;
  
  //get the startDate
  RxList<Glucose> get getStartDate => _startDate;
  //get the endDate
  RxList<Glucose> get getEndDate => _endDate;

  //get the date filtered _glucoseList
  RxList<Glucose> get getDateFilteredGlucoseList => _dateFilteredGlucoseList;

  //get the _minimumGlucoseValue
  RxList<Glucose> get getMinimumGlucoseValue => _minimumGlucoseValue;
  //get the _maximumGlucoseValue
  RxList<Glucose> get getMaximumGlucoseValue => _maximumGlucoseValue;
  //get the _averageGlucoseValue
  RxList<double> get getAverageGlucoseValue => _averageGlucoseValue;
  //get the _medianGlucoseValue
  RxList<double> get getMedianGlucoseValue => _medianGlucoseValue;

  //get the _isMaximumGlucoseValueHover
  RxBool get getIsMaximumGlucoseValueHover => _isMaximumGlucoseValueHover;
  //get the _isMinimumGlucoseValueHover
  RxBool get getIsMinimumGlucoseValueHover => _isMinimumGlucoseValueHover;
}
