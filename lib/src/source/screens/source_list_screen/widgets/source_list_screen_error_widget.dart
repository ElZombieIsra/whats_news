import 'package:flutter/material.dart';

class SourceListScreenError extends StatelessWidget {
  const SourceListScreenError(
    this.error, {
    Key? key,
  }) : super(key: key);

  final String? error;
  static const defaultError = 'An error ocurred while loading the sources';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error ?? defaultError),
    );
  }
}
