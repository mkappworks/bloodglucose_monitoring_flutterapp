import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:app_links/app_links.dart';

import 'package:bloodglucose_monitoring_flutterapp/controller/glucose_controller.dart';

import 'package:bloodglucose_monitoring_flutterapp/utils/constants.dart';
import 'package:bloodglucose_monitoring_flutterapp/utils/routes.dart';

import 'package:bloodglucose_monitoring_flutterapp/view/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(GlucoseController());
  // Lock the entire app orientation to Portrait mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlucoseController _glucoseController = Get.find();

  @override
  void initState() {
    super.initState();
    initDeepLinks();
  }

  void initDeepLinks() async {
    final _appLinks = AppLinks(onAppLink: (Uri uri, String stringUri) {
      setAppStartEndDate(stringUri);
    });

    final appLink = await _appLinks.getInitialAppLink();

    if (appLink != null && appLink.hasFragment && appLink.fragment != '/') {
      setAppStartEndDate(appLink.toString());
    }
  }

  void setAppStartEndDate(String stringUri) {
    if (stringUri.contains("glevels?start=") && stringUri.contains("&end=")) {
      List<String> uriList =
          stringUri.split("customscheme://mkappworks.com/bgm/glevels?start=");
      List<String> _startEndDateTime = uriList[1].split("&end=");
      if (_glucoseController.getStatus.value == GlucoseListStatus.loaded) {
        _glucoseController
            .setFilteredStartDate(DateTime.parse(_startEndDateTime[0]));
        _glucoseController.setFilteredEndDate(
            DateTime.parse(_startEndDateTime[1]).add(Duration(
                hours: 23, minutes: 59, seconds: 59, milliseconds: 999)));
        print(_startEndDateTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        textTheme: kTextThemeDefault,
        fontFamily: "Roboto",
      ),
      initialRoute: HomeScreen.routeName,
      getPages: routes,
    );
  }
}
