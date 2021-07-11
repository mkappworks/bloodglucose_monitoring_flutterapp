import 'package:flutter/material.dart';

import 'package:bloodglucose_monitoring_flutterapp/utils/constants.dart';

class ParameterCard extends StatelessWidget {
  final String label;
  final String value;

  ParameterCard({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final scaleHeigth = height / kMockupHeight;
    final scaleWidth = width / kMockupWidth;

    return Container(
        width: 80.0 * scaleWidth,
        height: 100.0 * scaleHeigth,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor.withOpacity(0.75),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              value,
              textScaleFactor: scaleWidth,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: Colors.white),
            ),
            Text(
              label,
              textScaleFactor: scaleWidth,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ));
  }
}
