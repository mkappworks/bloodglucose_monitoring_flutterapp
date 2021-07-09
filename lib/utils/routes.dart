import 'package:get/get.dart';

import 'package:bloodglucose_monitoring_flutterapp/view/home/home_screen.dart';

// All GetPages routes will be available here
List<GetPage<dynamic>> routes = [
  GetPage(name: HomeScreen.routeName, page: () => HomeScreen()),
];
