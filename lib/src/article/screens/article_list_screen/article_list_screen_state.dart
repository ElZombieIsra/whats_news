import 'package:equatable/equatable.dart';
import 'package:whats_news/src/article/model/article_model.dart';

abstract class ArticleListScreenState extends Equatable {
  const ArticleListScreenState();

  @override
  List<Object?> get props => [];
}

class NoSourceSelectedState extends ArticleListScreenState {
  const NoSourceSelectedState();
}

class ArticlesLoadingState extends ArticleListScreenState {
  const ArticlesLoadingState();
}

class ArticlesLoadedState extends ArticleListScreenState {
  const ArticlesLoadedState(this.articles);

  final List<ArticleModel> articles;

  @override
  List<Object?> get props => [articles];
}

class ArticlesErrorState extends ArticleListScreenState {
  const ArticlesErrorState(this.error);

  final String? error;

  @override
  List<Object?> get props => [error];
}
