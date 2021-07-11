import 'package:flutter/material.dart';

import 'package:bloodglucose_monitoring_flutterapp/utils/constants.dart';

class CustomTextIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String label;
  final double scale;

  CustomTextIconButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    this.scale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final scaleHeigth = height / kMockupHeight;
    final scaleWidth = width / kMockupWidth;
    return TextButton.icon(
      onPressed: onPressed as VoidCallback,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      style: TextButton.styleFrom(
        backgroundColor: kPrimaryColor.withOpacity(0.6),
        minimumSize: Size(150 * scale * scaleWidth, 50 * scaleHeigth),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      label: Text(
        label,
        textScaleFactor: scaleWidth,
        style: Theme.of(context).textTheme.headline4?.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
      ),
    );
  }
}
