import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:whats_news/src/article/data/repositories/article_favorite_repository.dart';
import 'package:whats_news/src/article/data/repositories/article_network_repository.dart';
import 'package:whats_news/src/article/data/services/article_service.dart';
import 'package:whats_news/src/article/model/article_model.dart';

import '../../../source/source_test_helpers.dart';
import '../../article_test_helpers.dart';
import '../repositories/mocks/article_favorite_repository_mock.dart';
import '../repositories/mocks/article_network_repository_mock.dart';

void main() {
  late ArticleFavoriteRepository favoriteRepository;
  late ArticleNetworkRepository repository;
  late ArticleNetworkService service;

  setUpAll(() {
    registerFallbackValue(articlesMockModels[0]);
    registerFallbackValue(sourcesMockModels[0]);
  });

  setUp(() {
    favoriteRepository = MockArticleFavoriteRepository();
    repository = MockArticleNetworkRepository();
    service = ArticleNetworkService(repository, favoriteRepository);
  });

  tearDown(() {
    reset(favoriteRepository);
    reset(repository);
  });

  test("should fetch all articles with no favorites", () async {
    when(() => favoriteRepository.fetch(any())).thenAnswer((_) async => []);
    when(() => repository.fetch(any()))
        .thenAnswer((_) async => articlesMockModels);

    final articles = await service.fetch(sourcesMockModels);

    expect(articles, equals(articlesMockModels));
  });

  test("should fetch all articles with one favorite", () async {
    final favoriteArticle = articlesMockModels[0];

    when(() => favoriteRepository.fetch(any()))
        .thenAnswer((_) async => [favoriteArticle]);
    when(() => repository.fetch(any()))
        .thenAnswer((_) async => articlesMockModels);

    final articlesWithFavorite = articlesMockModels
        .map((article) => article.title == favoriteArticle.title
            ? article.copyWith(isFavorite: true)
            : article)
        .toList();

    final articles = await service.fetch(sourcesMockModels);

    expect(articles, equals(articlesWithFavorite));
  });

  test("should add article to favorites", () async {
    final favoriteArticle = articlesMockModels[0];

    when(() => favoriteRepository.add(any()))
        .thenAnswer((invocation) async => invocation.positionalArguments[0]);

    final article = await service.favorite(favoriteArticle);

    expect(article, isNot(equals(favoriteArticle)));
    expect(article, equals(favoriteArticle.copyWith(isFavorite: true)));
    verify(() => favoriteRepository.add(favoriteArticle)).called(1);
  });

  test("should remove article from favorites", () async {
    final favoriteArticle = articlesMockModels[0].copyWith(isFavorite: true);

    when(() => favoriteRepository.remove(any()))
        .thenAnswer((invocation) async => invocation.positionalArguments[0]);

    final article = await service.favorite(favoriteArticle);

    expect(article, isNot(equals(favoriteArticle)));
    expect(article, equals(favoriteArticle.copyWith(isFavorite: false)));
    verify(() => favoriteRepository.remove(favoriteArticle)).called(1);
  });
}
