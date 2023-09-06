import 'package:whats_news/src/source/model/source_model.dart';

abstract class SourceService {
  Future<List<SourceModel>> fetch();
}
