import 'package:flutter/material.dart';
import 'package:whats_news/src/article/model/article_model.dart';

class ArticleListTile extends StatelessWidget {
  const ArticleListTile({
    super.key,
    required this.article,
  });

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article.title, maxLines: 2),
      subtitle: article.description != null
          ? Text(article.description!, maxLines: 2)
          : null,
    );
  }
}
