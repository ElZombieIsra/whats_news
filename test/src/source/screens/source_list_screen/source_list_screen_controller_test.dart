import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:state_notifier_test/state_notifier_test.dart';
import 'package:whats_news/src/source/data/services/source_service.dart';
import 'package:whats_news/src/source/screens/source_list_screen/source_list_screen_controller.dart';
import 'package:whats_news/src/source/screens/source_list_screen/source_list_screen_state.dart';

import '../../data/services/mocks/source_service_mock.dart';
import '../../source_test_helpers.dart';

void main() {
  late SourceService service;

  setUp(() {
    service = MockSourceService();
  });

  tearDown(() {
    reset(service);
  });

  stateNotifierTest(
    'should fetch sources',
    build: () => SourceListController(service),
    setUp: () {
      when(() => service.fetch()).thenAnswer((_) async => sourcesMockModels);
    },
    actions: (_) {},
    expect: () => [
      const SourcesLoadingState(),
      SourcesLoadedState(sourcesMockModels),
    ],
    verify: (_) {
      verify(() => service.fetch()).called(1);
    },
    expectInitialState: true,
  );

  stateNotifierTest(
    'should emit error state when fail',
    build: () => SourceListController(service),
    setUp: () {
      when(() => service.fetch())
          .thenAnswer((_) async => throw Exception("test"));
    },
    actions: (_) {},
    expect: () => [
      const SourcesLoadingState(),
      const SourcesErrorState("Exception: test"),
    ],
    verify: (_) {
      verify(() => service.fetch()).called(1);
    },
    expectInitialState: true,
  );
}
