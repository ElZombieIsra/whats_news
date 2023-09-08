import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/article/model/article_model.dart';
import 'package:whats_news/src/article/screens/article_detail_screen/article_detail_screen.dart';
import 'package:whats_news/src/source/screens/source_list_screen/source_list_screen.dart';

final articlesListScreenNavigationProvider =
    Provider<ArticlesListScreenNavigation>((ref) {
  return ArticlesListScreenNavigation();
});

class ArticlesListScreenNavigation {
  void sources(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SourceListScreen(),
      ),
    );
  }

  void detail(BuildContext context, ArticleModel article) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ArticleDetailScreen(article: article),
      ),
    );
  }
}
