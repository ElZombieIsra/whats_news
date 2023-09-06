import 'package:whats_news/src/article/model/article_model.dart';

abstract class ArticleService {
  Future<List<ArticleModel>> fetch();
}
