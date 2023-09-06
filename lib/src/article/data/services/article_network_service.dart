import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/article/data/services/article_service.dart';
import 'package:whats_news/src/article/model/article_model.dart';
import 'package:whats_news/src/http_client.dart';

final articleNetworkServiceProvider = Provider((ref) {
  final httpClient = ref.watch(authenticatedHttpClientProvider);
  return ArticleNetworkService(httpClient);
});

class ArticleNetworkService implements ArticleService {
  ArticleNetworkService(this._httpClient);

  final Dio _httpClient;

  @override
  Future<List<ArticleModel>> fetch() async {
    final rs = await _httpClient.get('/top-headlines?country=mx');
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
