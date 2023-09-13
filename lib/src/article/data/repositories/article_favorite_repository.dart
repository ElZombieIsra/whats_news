import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/article/data/data_sources/article_favorite_data_source.dart';
import 'package:whats_news/src/article/data/repositories/article_repository.dart';
import 'package:whats_news/src/article/model/article_model.dart';
import 'package:whats_news/src/source/model/source_model.dart';

final articleFavoriteRepositoryProvider = Provider<ArticleFavoriteRepository>(
  (ref) => ArticleFavoriteRepository(
    ref.watch(articleFavoriteDataSourceProvider),
  ),
);

class ArticleFavoriteRepository implements ArticleRepository {
  const ArticleFavoriteRepository(this._dataSource);

  final ArticleFavoriteDataSource _dataSource;

  @override
  Future<List<ArticleModel>> fetch(List<SourceModel> sources) async {
    final articles = _dataSource.fetchAll();
    return articles;
  }

  @override
  Future<ArticleModel> add(ArticleModel article) async {
    final addedArticle = _dataSource.add(article);
    return addedArticle;
  }

  @override
  Future<ArticleModel> remove(ArticleModel article) async {
    final removedArticle = _dataSource.remove(article);
    return removedArticle;
  }
}
