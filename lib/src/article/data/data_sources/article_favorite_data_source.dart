import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/article/model/article_model.dart';

final articleFavoriteDataSourceProvider = Provider<ArticleFavoriteDataSource>(
  (ref) {
    final dataSource = ArticleFavoriteDataSource();

    ref.onDispose(() {
      dataSource.dispose();
    });

    return dataSource;
  },
);

class ArticleFavoriteDataSource {
  ArticleFavoriteDataSource() : _box = Hive.box(name: _boxName);

  static const String _boxName = 'article_favorite_box';

  final Box<ArticleModel> _box;

  List<ArticleModel> fetchAll() {
    final keys = _box.keys;
    final articles = _box.getAll(keys);
    final cleanArticles = <ArticleModel>[];
    for (var article in articles) {
      if (article != null) {
        cleanArticles.add(article);
      }
    }
    return cleanArticles;
  }

  ArticleModel add(ArticleModel article) {
    _box.put(article.title, article);
    return article;
  }

  ArticleModel remove(ArticleModel article) {
    _box.delete(article.title);
    return article;
  }

  void dispose() {
    _box.close();
  }

  static void register() {
    Hive.registerAdapter(
      'ArticleModel',
      (value) => ArticleModel.fromJson(value),
    );
  }
}
