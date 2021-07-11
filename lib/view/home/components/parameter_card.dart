import 'package:flutter/material.dart';

import 'package:bloodglucose_monitoring_flutterapp/utils/constants.dart';

class ParameterCard extends StatelessWidget {
  final String label;

  ParameterCard({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final scaleHeigth = height / kMockupHeight;
    final scaleWidth = width / kMockupWidth;

    return Container(
      width: 150.0 * scaleWidth,
      height: 50.0 * scaleHeigth,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor.withOpacity(0.75),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Center(
        child: Text(
          label,
          textScaleFactor: scaleWidth,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
