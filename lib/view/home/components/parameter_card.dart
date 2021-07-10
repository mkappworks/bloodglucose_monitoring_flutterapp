import 'package:flutter/material.dart';

class ParameterCard extends StatelessWidget {
  final String label;

  ParameterCard({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor.withOpacity(0.75),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Center(
        child: Text(
          label,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
