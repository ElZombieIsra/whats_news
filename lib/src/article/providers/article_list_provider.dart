import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/article/data/repositories/article_network_repository.dart';
import 'package:whats_news/src/article/model/article_model.dart';

final articleListNotifierProvider =
    StateNotifierProvider.autoDispose<ArticleListNotifier, List<ArticleModel>>(
  (ref) {
    final articleRepository = ref.watch(articleNetworkRepositoryProvider);
    return ArticleListNotifier(articleRepository);
  },
);

class ArticleListNotifier extends StateNotifier<List<ArticleModel>> {
  ArticleListNotifier(this._articleRepository) : super([]) {
    fetch();
  }

  final ArticleNetworkRepository _articleRepository;

  Future<void> fetch() async {
    final articles = await _articleRepository.fetch();
    state = [...articles];
  }
}
