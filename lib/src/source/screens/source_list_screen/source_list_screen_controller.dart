import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/source/data/services/source_service.dart';
import 'package:whats_news/src/source/screens/source_list_screen/source_list_screen_state.dart';

final sourceListControllerProvider =
    StateNotifierProvider<SourceListController, SourceListScreenState>((ref) {
  final sourceService = ref.watch(sourceServiceProvider);
  return SourceListController(sourceService);
});

class SourceListController extends StateNotifier<SourceListScreenState> {
  SourceListController(this._sourceService)
      : super(const SourcesLoadingState()) {
    fetch();
  }

  final SourceService _sourceService;

  Future<void> fetch() async {
    state = const SourcesLoadingState();
    try {
      final sources = await _sourceService.fetch();
      state = SourcesLoadedState(sources);
    } catch (e) {
      state = SourcesErrorState(e.toString());
    }
  }
}
