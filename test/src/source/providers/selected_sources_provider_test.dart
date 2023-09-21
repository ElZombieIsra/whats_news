import 'package:state_notifier_test/state_notifier_test.dart';
import 'package:whats_news/src/source/model/source_model.dart';
import 'package:whats_news/src/source/providers/selected_sources_provider.dart';

import '../source_test_helpers.dart';

void main() {
  stateNotifierTest(
    'should select source',
    build: () => SelectedSourcesNotifier(),
    actions: (notifier) {
      notifier.selectSource(sourcesMockModels[0]);
    },
    expect: () => [
      <SourceModel>{},
      <SourceModel>{sourcesMockModels[0]},
    ],
    expectInitialState: true,
  );

  stateNotifierTest(
    'should unselect source',
    build: () => SelectedSourcesNotifier(),
    actions: (notifier) {
      notifier.selectSource(sourcesMockModels[0]);
      notifier.selectSource(sourcesMockModels[0]);
    },
    expect: () => [
      <SourceModel>{},
      <SourceModel>{sourcesMockModels[0]},
      <SourceModel>{},
    ],
    expectInitialState: true,
  );
}
