import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/article/data/repositories/article_repository.dart';
import 'package:whats_news/src/article/model/article_model.dart';
import 'package:whats_news/src/source/model/source_model.dart';

final articleFavoriteRepositoryProvider = Provider<ArticleFavoriteRepository>(
  (ref) {
    return ArticleFavoriteRepository();
  },
);

class ArticleFavoriteRepository implements ArticleRepository {
  @override
  Future<List<ArticleModel>> fetch(List<SourceModel> sources) {
    // TODO: implement fetch
    throw UnimplementedError();
  }
}
