import 'package:flutter/material.dart';

import 'package:bloodglucose_monitoring_flutterapp/utils/constants.dart';

class CustomTextIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String label;

  CustomTextIconButton({
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed as VoidCallback,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      style: kFlatButtonStyle,
      label: Text(
        label,
        style: Theme.of(context).textTheme.headline4?.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
      ),
    );
  }
}
