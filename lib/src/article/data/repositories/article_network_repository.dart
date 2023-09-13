import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/article/data/repositories/article_repository.dart';
import 'package:whats_news/src/article/model/article_model.dart';
import 'package:whats_news/src/http_client.dart';
import 'package:whats_news/src/source/model/source_model.dart';

final articleNetworkRepositoryProvider = Provider((ref) {
  final httpClient = ref.watch(authenticatedHttpClientProvider);
  return ArticleNetworkRepository(httpClient);
});

class ArticleNetworkRepository implements ArticleRepository {
  ArticleNetworkRepository(this._httpClient);

  final Dio _httpClient;

  @override
  Future<List<ArticleModel>> fetch(List<SourceModel> sources) async {
    final sourcesStr = sources.map((source) => source.id).join(',');
    final rs = await _httpClient.get(
      '/top-headlines',
      queryParameters: {
        "sources": sourcesStr,
      },
    );
    final List<ArticleModel> articles = [];
    final data = rs.data;
    if (data['status'] != 'ok') {
      throw Exception('No data was found');
    }
    for (final json in rs.data['articles']) {
      final article = ArticleModel.fromJson(json);
      articles.add(article);
    }
    return articles;
  }
}
