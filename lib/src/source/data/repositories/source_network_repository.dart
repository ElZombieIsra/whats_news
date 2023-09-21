import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/http_client.dart';
import 'package:whats_news/src/source/data/repositories/source_repository.dart';
import 'package:whats_news/src/source/model/source_model.dart';
import 'package:dio/dio.dart';

final sourceNetworkRepositoryProvider = Provider<SourceRepository>((ref) {
  final httpClient = ref.watch(authenticatedHttpClientProvider);
  return SourceNetworkRepository(httpClient);
});

class SourceNetworkRepository implements SourceRepository {
  SourceNetworkRepository(this._httpClient);

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
      try {
        final article = SourceModel.fromJson(json);
        sources.add(article);
      } catch (e) {
        throw Exception('Could not parse source model');
      }
    }
    return sources;
  }
}
