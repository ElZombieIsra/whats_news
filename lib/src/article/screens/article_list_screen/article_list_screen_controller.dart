import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/article/data/repositories/article_network_repository.dart';
import 'package:whats_news/src/article/screens/article_list_screen/article_list_screen_state.dart';
import 'package:whats_news/src/article/screens/article_list_screen/articles_list_screen_navigation.dart';

final articleListControllerProvider = StateNotifierProvider.autoDispose<
    ArticleListController, ArticleListScreenState>(
  (ref) {
    final articleRepository = ref.watch(articleNetworkRepositoryProvider);
    final articleNavigation = ref.watch(articlesListScreenNavigationProvider);
    return ArticleListController(articleRepository, articleNavigation);
  },
);

class ArticleListController extends StateNotifier<ArticleListScreenState> {
  ArticleListController(
    this._articleRepository,
    this.navigation,
  ) : super(NoSourceSelectedState());

  final ArticleNetworkRepository _articleRepository;
  final ArticlesListScreenNavigation navigation;

  Future<void> fetch() async {
    final articles = await _articleRepository.fetch();
    state = ArticlesLoadedState(articles);
  }
}
