import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/source/data/repositories/source_network_repository.dart';
import 'package:whats_news/src/source/data/repositories/source_repository.dart';
import 'package:whats_news/src/source/model/source_model.dart';

final sourceServiceProvider = Provider<SourceService>((ref) {
  final sourceRepository = ref.watch(sourceNetworkRepositoryProvider);
  return SourceService(sourceRepository);
});

class SourceService {
  const SourceService(this._sourceRepository);

  final SourceRepository _sourceRepository;

  Future<List<SourceModel>> fetch() {
    return _sourceRepository.fetch();
  }
}
