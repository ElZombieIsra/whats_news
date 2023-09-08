import 'package:flutter/material.dart';

class NoSourceSelectedWidget extends StatelessWidget {
  const NoSourceSelectedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          "To start, select a source using the button in the upper right corner",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
