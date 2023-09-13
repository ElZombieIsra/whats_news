import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whats_news/src/article/data/data_sources/article_favorite_data_source.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  final dir = await getApplicationDocumentsDirectory();
  Hive.defaultDirectory = dir.path;

  ArticleFavoriteDataSource.register();
}
