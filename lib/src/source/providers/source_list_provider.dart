import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/source/data/repositories/source_repository.dart';
import 'package:whats_news/src/source/model/source_model.dart';

final sourceListNotifierProvider =
    StateNotifierProvider<SourceListNotifier, List<SourceModel>>((ref) {
  final sourceRepository = ref.watch(sourceRepositoryProvider);
  return SourceListNotifier(sourceRepository);
});

class SourceListNotifier extends StateNotifier<List<SourceModel>> {
  SourceListNotifier(this._sourceRepository) : super([]) {
    fetch();
  }

  final SourceRepository _sourceRepository;

  Future<void> fetch() async {
    final sources = await _sourceRepository.fetch();
    state = [...sources];
  }
}
