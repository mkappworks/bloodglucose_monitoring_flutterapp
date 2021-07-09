import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:bloodglucose_monitoring_flutterapp/utils/constants.dart';
import 'package:bloodglucose_monitoring_flutterapp/utils/routes.dart';

import 'package:bloodglucose_monitoring_flutterapp/view/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Lock the entire app orientation to Portrait mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kSecondaryColor,
        textTheme: kTextThemeDefault,
        fontFamily: "Roboto",
      ),
      initialRoute: HomeScreen.routeName,
      getPages: routes,
    );
  }
}
