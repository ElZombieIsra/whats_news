import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/source/data/services/source_network_service.dart';
import 'package:whats_news/src/source/data/services/source_service.dart';
import 'package:whats_news/src/source/model/source_model.dart';

final sourceRepositoryProvider = Provider<SourceRepository>((ref) {
  final sourceService = ref.watch(sourceNetworkServiceProvider);
  return SourceRepository(sourceService);
});

class SourceRepository {
  const SourceRepository(this._sourceService);

  final SourceService _sourceService;

  Future<List<SourceModel>> fetch() {
    return _sourceService.fetch();
  }
}
