import 'package:flutter/material.dart';
import 'package:whats_news/src/article/components/article_list.dart';
import 'package:whats_news/src/article/model/article_model.dart';

class ArticleListScreenLoadedWidget extends StatelessWidget {
  const ArticleListScreenLoadedWidget({
    Key? key,
    required this.onRefresh,
    required this.articles,
  }) : super(key: key);

  final Future<void> Function() onRefresh;
  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ArticleList(articles: articles),
    );
  }
}
