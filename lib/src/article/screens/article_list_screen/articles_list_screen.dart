import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/article/screens/article_list_screen/article_list_screen_controller.dart';
import 'package:whats_news/src/article/screens/article_list_screen/article_list_screen_state.dart';
import 'package:whats_news/src/article/screens/article_list_screen/widgets/articles_loaded_widget.dart';
import 'package:whats_news/src/article/screens/article_list_screen/widgets/error_widget.dart';
import 'package:whats_news/src/article/screens/article_list_screen/widgets/no_source_selected_widget.dart';

class ArticlesListScreen extends ConsumerWidget {
  const ArticlesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleNotifier = ref.watch(articleListControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Whats News 🗞️"),
        actions: [
          IconButton(
            icon: const Icon(Icons.list_rounded),
            onPressed: () => articleNotifier.navigation.sources(context),
          )
        ],
      ),
      body: SafeArea(
        child: Consumer(builder: (context, ref, child) {
          final state = ref.watch(articleListControllerProvider);

          if (state is ArticlesErrorState) {
            return ArticleListScreenErrorWidget(
              error: state.error,
            );
          }

          if (state is ArticlesLoadedState) {
            return ArticlesLoadedWidget(
              onRefresh: articleNotifier.fetch,
              articles: state.articles ?? [],
            );
          }

          return const NoSourceSelectedWidget();
        }),
      ),
    );
  }
}
