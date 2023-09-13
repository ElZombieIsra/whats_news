import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/article/data/repositories/article_favorite_repository.dart';
import 'package:whats_news/src/article/data/repositories/article_network_repository.dart';
import 'package:whats_news/src/article/data/repositories/article_repository.dart';
import 'package:whats_news/src/article/model/article_model.dart';
import 'package:whats_news/src/source/model/source_model.dart';

final articleServiceProvider = Provider(
  (ref) => ArticleNetworkService(
    ref.watch(articleNetworkRepositoryProvider),
    ref.watch(articleFavoriteRepositoryProvider),
  ),
);

class ArticleNetworkService {
  const ArticleNetworkService(
    this._articleService,
    this._articleFavoriteRepository,
  );

  final ArticleRepository _articleService;
  final ArticleFavoriteRepository _articleFavoriteRepository;

  Future<List<ArticleModel>> fetch(List<SourceModel> sources) async {
    final articles = await _articleService.fetch(sources);
    final favoriteArticles = await _articleFavoriteRepository.fetch(sources);
    final Set<String> favoriteArticlesTitles =
        Set.from(favoriteArticles.map((article) => article.title));
    final allArticles = articles
        .map(
          (article) => article.copyWith(
            isFavorite: favoriteArticlesTitles.contains(article.title),
          ),
        )
        .toList();
    return allArticles;
  }
}
