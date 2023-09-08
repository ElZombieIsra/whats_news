import 'package:flutter/material.dart';

class SourceListScreenLoading extends StatelessWidget {
  const SourceListScreenLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
