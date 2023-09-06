import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/article/components/article_list.dart';
import 'package:whats_news/src/article/providers/article_list_provider.dart';

class ArticlesListScreen extends ConsumerWidget {
  const ArticlesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleNotifier = ref.watch(articleListNotifierProvider.notifier);
    final articles = ref.watch(articleListNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Whats News 🗞️")),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: articleNotifier.fetch,
          child: ArticleList(articles: articles),
        ),
      ),
    );
  }
}
