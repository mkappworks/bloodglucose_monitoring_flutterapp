import 'package:bloodglucose_monitoring_flutterapp/model/glucose.dart';
import 'package:get/get.dart';

enum GlucoseListStatus { loading, loaded, empty }

abstract class GlucoseInterface {
  Future<void> setGlucoseList();

  void setApiStartEndDate(List<Glucose> currentList);

  void setFilteredStartDate(DateTime startDate);

  void setFilteredEndDate(DateTime endDate);

  void setDateFilteredGlucoseList();

  void setGlucoseParameters(List<Glucose> currentList);

  void setIsMaximumGlucoseValueHover();

  void setIsMinimumGlucoseValueHover();

  Future<void> postGlucoseData();

  Future<void> saveGlucoseData();

  void setThreshold(double threshold);

  void setThresholdPercentage();

  Rx<GlucoseListStatus> get getStatus;

  RxList<DateTime> get getFilteredStartDate;

  RxList<DateTime> get getFilteredEndDate;

  RxList<Glucose> get getDateFilteredGlucoseList;

  RxList<Glucose> get getMinimumGlucoseValue;

  RxList<Glucose> get getMaximumGlucoseValue;

  RxList<double> get getAverageGlucoseValue;

  RxList<double> get getMedianGlucoseValue;

  RxBool get getIsMaximumGlucoseValueHover;

  RxBool get getIsMinimumGlucoseValueHover;

  RxList<double> get getThresholdPercentage;
}
