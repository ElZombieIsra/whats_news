import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:whats_news/src/article/data/repositories/article_network_repository.dart';
import 'package:whats_news/src/article/model/article_model.dart';

import '../../../source/source_test_helpers.dart';
import '../../article_test_helpers.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late ArticleNetworkRepository repository;

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    repository = ArticleNetworkRepository(dio);
  });

  test(
    'should fetch articles from API',
    () async {
      dioAdapter.onGet(
        '/top-headlines',
        (server) => server.reply(201, {
          'status': "ok",
          'articles': mockArticlesJson,
        }),
      );

      final articleMockModels =
          mockArticlesJson.map(ArticleModel.fromJson).toList();

      final sources = await repository.fetch(sourcesMockModels);
      expect(sources, equals(articleMockModels));
    },
  );

  test(
    'should throw when status is not "ok"',
    () async {
      dioAdapter.onGet(
        '/top-headlines',
        (server) => server.reply(201, {
          'status': "error",
          'articles': mockArticlesJson,
        }),
      );

      expect(
        () async => await repository.fetch(sourcesMockModels),
        throwsA(
          predicate(
            (e) =>
                e is Exception &&
                e.toString() == 'Exception: No data was found',
          ),
        ),
      );
    },
  );

  test(
    'should throw when an article could not be parsed',
    () async {
      final articlesWithError = [
        ...mockArticlesJson,

        /// Missing required "name"
        {
          "id": "abc-news-au",
          "description": "Australia news",
          "url": "http://www.abc.net.au/news",
          "category": "general",
          "language": "en",
          "country": "au"
        },
      ];

      dioAdapter.onGet(
        '/top-headlines',
        (server) => server.reply(201, {
          'status': "ok",
          'articles': articlesWithError,
        }),
      );

      expect(
        () async => await repository.fetch(sourcesMockModels),
        throwsA(
          predicate(
            (e) =>
                e is Exception &&
                e.toString() == 'Exception: Could not parse article model',
          ),
        ),
      );
    },
  );
}
