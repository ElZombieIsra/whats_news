import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:whats_news/src/source/data/repositories/source_network_repository.dart';

import '../../source_test_helpers.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late SourceNetworkRepository repository;

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    repository = SourceNetworkRepository(dio);
  });

  test(
    'should fetch sources from API',
    () async {
      dioAdapter.onGet(
        '/top-headlines/sources',
        (server) => server.reply(201, {
          'status': "ok",
          'sources': mockSourcesJson,
        }),
      );

      final sources = await repository.fetch();
      expect(sources, equals(sourcesMockModels));
    },
  );

  test(
    'should throw when status is not "ok"',
    () async {
      dioAdapter.onGet(
        '/top-headlines/sources',
        (server) => server.reply(201, {
          'status': "error",
          'sources': mockSourcesJson,
        }),
      );

      expect(
        () async => await repository.fetch(),
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
    'should throw when a source could not be parsed',
    () async {
      final sourcesWithError = [
        ...mockSourcesJson,

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
        '/top-headlines/sources',
        (server) => server.reply(201, {
          'status': "ok",
          'sources': sourcesWithError,
        }),
      );

      expect(
        () async => await repository.fetch(),
        throwsA(
          predicate(
            (e) =>
                e is Exception &&
                e.toString() == 'Exception: Could not parse source model',
          ),
        ),
      );
    },
  );
}
