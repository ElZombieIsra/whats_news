import 'package:whats_news/src/article/model/article_model.dart';
import 'package:whats_news/src/source/model/source_model.dart';

abstract class ArticleService {
  Future<List<ArticleModel>> fetch(List<SourceModel> sources);
}
