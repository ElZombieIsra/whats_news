import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:whats_news/src/source/data/repositories/source_repository.dart';
import 'package:whats_news/src/source/data/services/source_service.dart';

import '../../source_test_helpers.dart';
import '../repositories/mocks/source_network_repository_mock.dart';

void main() {
  late SourceRepository repository;
  late SourceService service;

  setUp(() {
    repository = MockSourceNetworkRepository();
    service = SourceService(repository);
  });

  tearDown(() {
    reset(repository);
  });

  test("should fetch sources", () async {
    when(() => repository.fetch()).thenAnswer((_) async => sourcesMockModels);

    final sources = await service.fetch();

    expect(sources, equals(sourcesMockModels));
    verify(() => repository.fetch()).called(1);
  });
}
