import 'package:flutter/material.dart';

class ArticleListScreenLoadingWidget extends StatelessWidget {
  const ArticleListScreenLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
