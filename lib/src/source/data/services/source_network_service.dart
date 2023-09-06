import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/http_client.dart';
import 'package:whats_news/src/source/data/services/source_service.dart';
import 'package:whats_news/src/source/model/source_model.dart';
import 'package:dio/dio.dart';

final sourceNetworkServiceProvider = Provider<SourceService>((ref) {
  final httpClient = ref.watch(authenticatedHttpClientProvider);
  return SourceNetworkService(httpClient);
});

class SourceNetworkService implements SourceService {
  SourceNetworkService(this._httpClient);

  final Dio _httpClient;

  @override
  Future<List<SourceModel>> fetch() async {
    final rs = await _httpClient.get("/top-headlines/sources");
    final List<SourceModel> sources = [];
    final data = rs.data;
    if (data['status'] != 'ok') {
      throw Exception('No data was found');
    }
    for (final json in rs.data['sources']) {
      final article = SourceModel.fromJson(json);
      sources.add(article);
    }
    return sources;
  }
}
