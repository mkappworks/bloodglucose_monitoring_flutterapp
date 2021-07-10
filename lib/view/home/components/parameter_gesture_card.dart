import 'package:flutter/material.dart';

import 'package:bloodglucose_monitoring_flutterapp/view/home/components/parameter_card.dart';

class ParameterGestureCard extends StatelessWidget {
  final Function onLongPressFn;
  final Function(LongPressEndDetails details) onLongPressEndFn;
  final String label;

  ParameterGestureCard({
    required this.onLongPressFn,
    required this.onLongPressEndFn,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPressFn as VoidCallback,
      onLongPressEnd: onLongPressEndFn,
      child: ParameterCard(label: label),
    );
  }
}
