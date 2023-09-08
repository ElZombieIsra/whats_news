import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/source/model/source_model.dart';

final selectedSourcesProvider =
    StateNotifierProvider<SelectedSourcesNotifier, Set<SourceModel>>((ref) {
  return SelectedSourcesNotifier();
});

class SelectedSourcesNotifier extends StateNotifier<Set<SourceModel>> {
  SelectedSourcesNotifier() : super(<SourceModel>{});

  void selectSource(SourceModel source) {
    final hasSource = state.contains(source);
    final newState = Set<SourceModel>.from(state);
    if (hasSource) {
      newState.remove(source);
    } else {
      newState.add(source);
    }
    state = newState;
  }
}
