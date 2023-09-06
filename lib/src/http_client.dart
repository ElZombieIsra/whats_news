import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authenticatedHttpClientProvider = Provider(
  (ref) {
    final options = BaseOptions(
      baseUrl: "https://newsapi.org/v2",
      headers: {'Authorization': dotenv.get('NEWS_API_KEY')},
    );
    return Dio(options);
  },
);
