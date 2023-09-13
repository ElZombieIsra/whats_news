import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/article/data/repositories/article_network_repository.dart';
import 'package:whats_news/src/article/data/repositories/article_repository.dart';
import 'package:whats_news/src/article/model/article_model.dart';
import 'package:whats_news/src/source/model/source_model.dart';

final articleServiceProvider = Provider((ref) {
  final articleRepository = ref.watch(articleNetworkRepositoryProvider);
  return ArticleNetworkService(articleRepository);
});

class ArticleNetworkService {
  const ArticleNetworkService(this._articleService);

  final ArticleRepository _articleService;

  Future<List<ArticleModel>> fetch(List<SourceModel> sources) async {
    final articles = await _articleService.fetch(sources);
    return articles;
  }
}
