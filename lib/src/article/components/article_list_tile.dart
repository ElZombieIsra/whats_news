import 'package:flutter/material.dart';
import 'package:whats_news/src/article/model/article_model.dart';

class ArticleListTile extends StatelessWidget {
  const ArticleListTile({
    super.key,
    required this.article,
    this.isFavorite = false,
    required this.onFavorite,
    required this.onTap,
  });

  final ArticleModel article;
  final bool isFavorite;
  final void Function(ArticleModel) onFavorite;
  final void Function(ArticleModel) onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article.title, maxLines: 2),
      subtitle: article.description != null
          ? Text(article.description!, maxLines: 2)
          : null,
      trailing: IconButton(
        icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
        onPressed: () => onFavorite(article),
      ),
      onTap: () => onTap(article),
    );
  }
}
