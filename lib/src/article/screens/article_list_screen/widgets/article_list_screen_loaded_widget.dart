import 'package:flutter/material.dart';
import 'package:whats_news/src/article/components/article_list.dart';
import 'package:whats_news/src/article/model/article_model.dart';

class ArticleListScreenLoadedWidget extends StatelessWidget {
  const ArticleListScreenLoadedWidget({
    Key? key,
    required this.articles,
    required this.onRefresh,
    required this.onTap,
    required this.onFavorite,
  }) : super(key: key);

  final List<ArticleModel> articles;
  final Future<void> Function() onRefresh;
  final void Function(ArticleModel) onTap;
  final void Function(ArticleModel) onFavorite;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ArticleList(
        articles: articles,
        onTap: onTap,
        onFavorite: onFavorite,
      ),
    );
  }
}
