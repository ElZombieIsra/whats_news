import 'package:flutter/material.dart';

class ArticleListScreenErrorWidget extends StatelessWidget {
  const ArticleListScreenErrorWidget({
    super.key,
    this.error,
  });

  final String? error;
  static const String defaultErrorMessage =
      'An error ocurred while loading the articles';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error ?? defaultErrorMessage),
    );
  }
}
