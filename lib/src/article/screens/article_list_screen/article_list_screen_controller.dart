import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/article/data/repositories/article_network_repository.dart';
import 'package:whats_news/src/article/screens/article_list_screen/article_list_screen_state.dart';
import 'package:whats_news/src/article/screens/article_list_screen/articles_list_screen_navigation.dart';
import 'package:whats_news/src/source/model/source_model.dart';

final articleListControllerProvider = StateNotifierProvider.family<
    ArticleListController, ArticleListScreenState, Set<SourceModel>>(
  (ref, selectedSources) {
    final articleRepository = ref.watch(articleNetworkRepositoryProvider);
    final articleNavigation = ref.watch(articlesListScreenNavigationProvider);
    return ArticleListController(
      articleRepository,
      navigation: articleNavigation,
      selectedSources: selectedSources,
    );
  },
);

class ArticleListController extends StateNotifier<ArticleListScreenState> {
  ArticleListController(
    this._articleRepository, {
    required this.navigation,
    required this.selectedSources,
  }) : super(NoSourceSelectedState()) {
    fetch();
  }

  final ArticleNetworkRepository _articleRepository;
  final ArticlesListScreenNavigation navigation;
  final Set<SourceModel> selectedSources;

  Future<void> fetch() async {
    if (selectedSources.isEmpty) {
      return;
    }

    final articles = await _articleRepository.fetch(selectedSources.toList());
    state = ArticlesLoadedState(articles);
  }
}
