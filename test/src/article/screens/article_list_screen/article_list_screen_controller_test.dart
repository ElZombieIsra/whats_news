import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:state_notifier_test/state_notifier_test.dart';
import 'package:whats_news/src/article/data/services/article_service.dart';
import 'package:whats_news/src/article/screens/article_list_screen/article_list_screen_controller.dart';
import 'package:whats_news/src/article/screens/article_list_screen/article_list_screen_state.dart';
import 'package:whats_news/src/article/screens/article_list_screen/articles_list_screen_navigation.dart';
import 'package:whats_news/src/source/model/source_model.dart';

import '../../../source/source_test_helpers.dart';
import '../../article_test_helpers.dart';
import '../../data/services/mocks/article_service_mock.dart';
import 'mocks/article_list_screen_navigation_mock.dart';

void main() {
  late ArticleNetworkService service;
  late ArticlesListScreenNavigation navigation;

  setUpAll(() {
    registerFallbackValue(sourcesMockModels[0]);
    registerFallbackValue(articlesMockModels[0]);
  });

  setUp(() {
    service = MockArticleNetworkService();
    navigation = MockArticlesListScreenNavigation();
  });

  tearDown(() {
    reset(service);
    reset(navigation);
  });

  stateNotifierTest(
    'should not fetch articles with empty sources',
    build: () => ArticleListController(
      service,
      selectedSources: <SourceModel>{},
      navigation: navigation,
    ),
    actions: (_) {},
    expect: () => [
      const NoSourceSelectedState(),
    ],
    verify: (_) {
      verifyNever(() => service.fetch(any()));
    },
    expectInitialState: true,
  );

  stateNotifierTest(
    'should fetch articles',
    build: () => ArticleListController(
      service,
      selectedSources: Set.from(sourcesMockModels),
      navigation: navigation,
    ),
    setUp: () {
      when(() => service.fetch(any()))
          .thenAnswer((_) async => articlesMockModels);
    },
    actions: (_) {},
    expect: () => [
      const NoSourceSelectedState(),
      ArticlesLoadedState(articlesMockModels),
    ],
    verify: (_) {
      verify(() => service.fetch(sourcesMockModels)).called(1);
    },
    expectInitialState: true,
  );

  stateNotifierTest(
    'should re fetch articles automatically',
    build: () => ArticleListController(
      service,
      selectedSources: Set.from(sourcesMockModels),
      navigation: navigation,
      timerDuration: const Duration(milliseconds: 100),
    ),
    setUp: () {
      when(() => service.fetch(any()))
          .thenAnswer((_) async => articlesMockModels);
    },
    actions: (_) async {
      await Future.delayed(const Duration(milliseconds: 150));
    },
    expect: () => [
      const NoSourceSelectedState(),
      ArticlesLoadedState(articlesMockModels),
      ArticlesLoadedState(articlesMockModels),
    ],
    verify: (_) {
      verify(() => service.fetch(sourcesMockModels)).called(2);
    },
    expectInitialState: true,
  );

  stateNotifierTest(
    'should emit error state on throw',
    build: () => ArticleListController(
      service,
      selectedSources: Set.from(sourcesMockModels),
      navigation: navigation,
    ),
    setUp: () {
      when(() => service.fetch(any()))
          .thenAnswer((_) async => throw Exception("test"));
    },
    actions: (_) {},
    expect: () => [
      const NoSourceSelectedState(),
      const ArticlesErrorState('Exception: test'),
    ],
    verify: (_) {
      verify(() => service.fetch(sourcesMockModels)).called(1);
    },
    expectInitialState: true,
  );

  stateNotifierTest(
    'should favorite article',
    build: () => ArticleListController(
      service,
      selectedSources: Set.from(sourcesMockModels),
      navigation: navigation,
    ),
    setUp: () {
      when(() => service.fetch(any()))
          .thenAnswer((_) async => articlesMockModels);
      when(() => service.favorite(any()))
          .thenAnswer((invocation) async => invocation.positionalArguments[0]);
    },
    actions: (controller) async {
      await controller.favorite(articlesMockModels[0]);
    },
    expect: () => [
      const NoSourceSelectedState(),
      ArticlesLoadedState(articlesMockModels),
      ArticlesLoadedState(articlesMockModels),
    ],
    verify: (_) {
      verify(() => service.fetch(sourcesMockModels)).called(2);
      verify(() => service.favorite(articlesMockModels[0])).called(1);
    },
    expectInitialState: true,
  );
}
