import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:whats_news/src/article/data/data_sources/article_favorite_data_source.dart';
import 'package:whats_news/src/article/data/repositories/article_favorite_repository.dart';

import '../../../source/source_test_helpers.dart';
import '../../article_test_helpers.dart';
import '../data_sources/mocks/article_favorite_data_source_mock.dart';

void main() {
  late ArticleFavoriteDataSource dataSource;
  late ArticleFavoriteRepository repository;
  final sources = sourcesMockModels;

  setUpAll(() {
    registerFallbackValue(articlesMockModels[0]);
  });

  setUp(() {
    dataSource = MockArticleFavoriteDataSource();
    repository = ArticleFavoriteRepository(dataSource);
  });

  tearDown(() {
    reset(dataSource);
  });

  test('should fetch favorite articles', () async {
    when(() => dataSource.fetchAll()).thenReturn(articlesMockModels);

    final articles = await repository.fetch(sources);

    expect(articles, equals(articlesMockModels));
    verify(() => dataSource.fetchAll()).called(1);
  });

  test('should add favorite article', () async {
    when(() => dataSource.add(any()))
        .thenAnswer((invocation) => invocation.positionalArguments[0]);

    final articleToAdd = articlesMockModels[0];

    final favoriteArticle = await repository.add(articleToAdd);

    verify(() => dataSource.add(any())).called(1);
    expect(favoriteArticle, equals(articleToAdd));
  });

  test('should remove favorite article', () async {
    when(() => dataSource.remove(any()))
        .thenAnswer((invocation) => invocation.positionalArguments[0]);

    final articleToRemove = articlesMockModels[0];

    final favoriteArticle = await repository.remove(articleToRemove);

    verify(() => dataSource.remove(any())).called(1);
    expect(favoriteArticle, equals(articleToRemove));
  });
}
