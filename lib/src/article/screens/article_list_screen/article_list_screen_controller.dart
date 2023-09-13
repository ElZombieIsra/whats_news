import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/article/data/services/article_service.dart';
import 'package:whats_news/src/article/model/article_model.dart';
import 'package:whats_news/src/article/screens/article_list_screen/article_list_screen_state.dart';
import 'package:whats_news/src/article/screens/article_list_screen/articles_list_screen_navigation.dart';
import 'package:whats_news/src/source/model/source_model.dart';

final articleListControllerProvider = StateNotifierProvider.family<
    ArticleListController, ArticleListScreenState, Set<SourceModel>>(
  (ref, selectedSources) {
    final articleService = ref.watch(articleServiceProvider);
    final articleNavigation = ref.watch(articlesListScreenNavigationProvider);

    return ArticleListController(
      articleService,
      navigation: articleNavigation,
      selectedSources: selectedSources,
    );
  },
);

class ArticleListController extends StateNotifier<ArticleListScreenState> {
  ArticleListController(
    this._articleService, {
    required this.navigation,
    required this.selectedSources,
  }) : super(NoSourceSelectedState()) {
    fetch();
  }

  final ArticleNetworkService _articleService;
  final ArticlesListScreenNavigation navigation;
  final Set<SourceModel> selectedSources;

  Timer? refreshTimer;

  Future<void> fetch() async {
    if (selectedSources.isEmpty) {
      return;
    }

    if (refreshTimer?.isActive ?? false) refreshTimer!.cancel();

    final articles = await _articleService.fetch(selectedSources.toList());
    state = ArticlesLoadedState(articles);

    refreshTimer = Timer(const Duration(minutes: 2), fetch);
  }

  void favorite(ArticleModel article) async {
    await _articleService.favorite(article);
    await fetch();
  }

  @override
  void dispose() {
    refreshTimer?.cancel();
    super.dispose();
  }
}
