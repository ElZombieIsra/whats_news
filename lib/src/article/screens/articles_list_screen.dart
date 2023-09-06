import 'package:flutter/material.dart';
import 'package:whats_news/src/article/components/article_list.dart';
import 'package:whats_news/src/article/data/repositories/article_network_repository.dart';
import 'package:whats_news/src/article/data/services/article_mock_service.dart';
import 'package:whats_news/src/article/model/article_model.dart';

class ArticlesListScreen extends StatefulWidget {
  const ArticlesListScreen({super.key});

  @override
  State<ArticlesListScreen> createState() => _ArticlesListScreenState();
}

class _ArticlesListScreenState extends State<ArticlesListScreen> {
  List<ArticleModel> articles = [];

  void fetchArticles() async {
    final articleService = ArticleMockService();
    final articleRepository = ArticleNetworkRepository(articleService);
    final newArticles = await articleRepository.fetch();
    setState(() => articles = newArticles);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => fetchArticles());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Whats News 🗞️")),
      body: SafeArea(
        child: ArticleList(articles: articles),
      ),
    );
  }
}
