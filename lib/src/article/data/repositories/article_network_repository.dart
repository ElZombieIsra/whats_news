import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/article/data/services/article_network_service.dart';
import 'package:whats_news/src/article/data/services/article_service.dart';
import 'package:whats_news/src/article/model/article_model.dart';
import 'package:whats_news/src/source/model/source_model.dart';

final articleNetworkRepositoryProvider = Provider((ref) {
  final articleService = ref.watch(articleNetworkServiceProvider);
  return ArticleNetworkRepository(articleService);
});

class ArticleNetworkRepository {
  const ArticleNetworkRepository(this._articleService);

  final ArticleService _articleService;

  Future<List<ArticleModel>> fetch(List<SourceModel> sources) async {
    final articles = await _articleService.fetch(sources);
    return articles;
  }
}
