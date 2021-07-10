import 'package:bloodglucose_monitoring_flutterapp/controller/helper/glucose_utils_helper.dart';
import 'package:get/get.dart';

import 'package:bloodglucose_monitoring_flutterapp/controller/helper/glucose_service_helper.dart';

import 'package:bloodglucose_monitoring_flutterapp/model/glucose.dart';

enum GlucoseListStatus { loading, loaded, empty }

class GlucoseController extends GetxController {
  Rx<GlucoseListStatus> _status = GlucoseListStatus.loading.obs;
  RxList<Glucose> _glucoseList = <Glucose>[].obs;
  RxList<Glucose> _minimumGlucoseValue = <Glucose>[].obs;
  RxList<Glucose> _maximumGlucoseValue = <Glucose>[].obs;
  RxList<double> _averageGlucoseValue = <double>[].obs;
  RxList<double> _medianGlucoseValue = <double>[].obs;
  RxBool _isMaximumGlucoseValueHover = false.obs;
  RxBool _isMinimumGlucoseValueHover = false.obs;
  RxList<Glucose> _glucoseListStartDate = <Glucose>[].obs;
  RxList<Glucose> _glucoseListEndDate = <Glucose>[].obs;

  Future<void> onInit() async {
    super.onInit();
    await _setGlucoseList();
  }

  //Function to get and set all raw glucose data external api
  Future<void> _setGlucoseList() async {
    _status.value = GlucoseListStatus.loading;

    _glucoseList
        .assignAll(await GlucoseServiceHelper.shared.fetchGlucoseList());

    if (_glucoseList.isEmpty) {
      _status.value = GlucoseListStatus.empty;
    } else {
      setGlucosseParameters();
      _status.value = GlucoseListStatus.loaded;
    }

    update();
  }

  //Function to calculate and set all max, min, average and median glucose value from _glucoseList
  void setGlucosseParameters() {
    //get the maximum glucose value
    _maximumGlucoseValue
        .assign(GlucoseUtilsHelper.shared.getMaximumGlucoseValue(_glucoseList));

    //get the minimum glucose value
    _minimumGlucoseValue
        .assign(GlucoseUtilsHelper.shared.getMinimumGlucoseValue(_glucoseList));

    // calculating the average glucose value
    _averageGlucoseValue.assign(
        GlucoseUtilsHelper.shared.calculateAverageGlucoseValue(_glucoseList));

    // calculating the median glucose value
    _medianGlucoseValue.assign(
        GlucoseUtilsHelper.shared.calculateMedianGlucoseValue(_glucoseList));

    //get the start date of _glucoseList
    _glucoseListStartDate.assign(
        GlucoseUtilsHelper.shared.getGlucoseListStartDate(_glucoseList));

    //get the end date of _glucoseList
    _glucoseListEndDate
        .assign(GlucoseUtilsHelper.shared.getGlucoseListEndDate(_glucoseList));

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
  //get the _glucoseList
  RxList<Glucose> get getGlucoseList => _glucoseList;
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
