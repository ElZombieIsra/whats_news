import 'package:whats_news/src/source/model/source_model.dart';

abstract class SourceRepository {
  Future<List<SourceModel>> fetch();
}
