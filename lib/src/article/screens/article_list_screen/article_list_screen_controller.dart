import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/article/data/repositories/article_network_repository.dart';
import 'package:whats_news/src/article/screens/article_list_screen/article_list_screen_state.dart';

final articleListControllerProvider = StateNotifierProvider.autoDispose<
    ArticleListController, ArticleListScreenState>(
  (ref) {
    final articleRepository = ref.watch(articleNetworkRepositoryProvider);
    return ArticleListController(articleRepository);
  },
);

class ArticleListController extends StateNotifier<ArticleListScreenState> {
  ArticleListController(this._articleRepository)
      : super(NoSourceSelectedState());

  final ArticleNetworkRepository _articleRepository;

  Future<void> fetch() async {
    final articles = await _articleRepository.fetch();
    state = ArticlesLoadedState(articles);
  }
}
