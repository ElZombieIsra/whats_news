import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
}
