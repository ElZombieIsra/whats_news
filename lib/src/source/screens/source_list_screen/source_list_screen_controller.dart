import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/source/data/repositories/source_repository.dart';
import 'package:whats_news/src/source/screens/source_list_screen/source_list_screen_state.dart';

final sourceListControllerProvider =
    StateNotifierProvider<SourceListController, SourceListScreenState>((ref) {
  final sourceRepository = ref.watch(sourceRepositoryProvider);
  return SourceListController(sourceRepository);
});

class SourceListController extends StateNotifier<SourceListScreenState> {
  SourceListController(this._sourceRepository) : super(SourcesLoadingState()) {
    fetch();
  }

  final SourceRepository _sourceRepository;

  Future<void> fetch() async {
    state = SourcesLoadingState();
    try {
      final sources = await _sourceRepository.fetch();
      state = SourcesLoadedState(sources);
    } catch (e) {
      state = SourcesErrorState(e.toString());
    }
  }
}
