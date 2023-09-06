import 'package:flutter/material.dart';
import 'package:whats_news/src/article/components/article_list_tile.dart';
import 'package:whats_news/src/article/model/article_model.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({
    super.key,
    required this.articles,
  });

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) {
      return const Center(
        child: Text("Nothing to show"),
      );
    }
    return ListView.builder(
      itemBuilder: (_, i) => ArticleListTile(article: articles[i]),
      itemCount: articles.length,
    );
  }
}
