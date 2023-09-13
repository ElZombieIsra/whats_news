import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/article/screens/article_list_screen/article_list_screen_controller.dart';
import 'package:whats_news/src/article/screens/article_list_screen/article_list_screen_state.dart';
import 'package:whats_news/src/article/screens/article_list_screen/widgets/article_list_screen_loaded_widget.dart';
import 'package:whats_news/src/article/screens/article_list_screen/widgets/article_list_screen_error.dart';
import 'package:whats_news/src/article/screens/article_list_screen/widgets/article_list_screen_loading.dart';
import 'package:whats_news/src/article/screens/article_list_screen/widgets/article_list_screen_no_source_selected_widget.dart';
import 'package:whats_news/src/source/providers/selected_sources_provider.dart';

class ArticlesListScreen extends ConsumerWidget {
  const ArticlesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSources = ref.watch(selectedSourcesProvider);
    final articleListController =
        articleListControllerProvider(selectedSources);
    final articleNotifier = ref.watch(articleListController.notifier);

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
          final state = ref.watch(articleListController);

          if (state is ArticlesErrorState) {
            return ArticleListScreenErrorWidget(
              error: state.error,
            );
          }

          if (state is ArticlesLoadedState) {
            return ArticleListScreenLoadedWidget(
              articles: state.articles,
              onRefresh: articleNotifier.fetch,
              onTap: (article) =>
                  articleNotifier.navigation.detail(context, article),
              onFavorite: articleNotifier.favorite,
            );
          }

          if (state is NoSourceSelectedState) {
            return const ArticleListScreenNoSourceSelectedWidget();
          }

          return const ArticleListScreenLoadingWidget();
        }),
      ),
    );
  }
}
