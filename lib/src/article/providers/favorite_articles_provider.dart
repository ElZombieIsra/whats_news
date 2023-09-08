import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:whats_news/src/article/model/article_model.dart';

final favoriteArticlesProvider =
    StateNotifierProvider<FavoriteArticlesNotifier, Set<ArticleModel>>((ref) {
  return FavoriteArticlesNotifier();
});

class FavoriteArticlesNotifier extends StateNotifier<Set<ArticleModel>> {
  FavoriteArticlesNotifier() : super(<ArticleModel>{});

  void favorite(ArticleModel article) async {
    final newState = Set<ArticleModel>.from(state);
    final isFavorite = newState.contains(article);
    if (isFavorite) {
      newState.remove(article);
    } else {
      newState.add(article);
    }
    state = newState;
  }
}
