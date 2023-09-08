import 'package:flutter/material.dart';
import 'package:whats_news/src/article/components/article_list_tile.dart';
import 'package:whats_news/src/article/model/article_model.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({
    super.key,
    required this.articles,
    required this.favoriteArticles,
    required this.onTap,
    required this.onFavorite,
  });

  final List<ArticleModel> articles;
  final Set<ArticleModel> favoriteArticles;
  final void Function(ArticleModel) onTap;
  final void Function(ArticleModel) onFavorite;

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) {
      return const Center(
        child: Text("Nothing to show"),
      );
    }
    return ListView.builder(
      itemBuilder: (_, i) {
        final article = articles[i];
        final isFavorite = favoriteArticles.contains(article);

        return ArticleListTile(
          article: article,
          onTap: onTap,
          onFavorite: onFavorite,
          isFavorite: isFavorite,
        );
      },
      itemCount: articles.length,
    );
  }
}
