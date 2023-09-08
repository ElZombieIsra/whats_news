import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whats_news/src/article/model/article_model.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({
    super.key,
    required this.article,
  });

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[
      if (article.urlToImage != null) Image.network(article.urlToImage!),
      Text(
        article.title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      if (article.description != null)
        Text(
          article.description!,
          style: const TextStyle(fontSize: 20),
        ),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Author: ${article.author ?? ""}',
            style: const TextStyle(color: Colors.black54),
          ),
          Text(
            'Published: ${article.publishedAt ?? ""}',
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
      const Divider(),
      Text(article.content ?? ""),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(article.source.name),
        actions: [
          if (article.url != null)
            IconButton(
              icon: const Icon(Icons.open_in_new),
              onPressed: () async {
                final Uri url = Uri.parse(article.url!);
                final canLaunch = await canLaunchUrl(url);
                if (!canLaunch) return;
                await launchUrl(url);
              },
            ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, i) => widgets[i],
        separatorBuilder: (_, __) => const SizedBox(height: 4),
        itemCount: widgets.length,
      ),
    );
  }
}
