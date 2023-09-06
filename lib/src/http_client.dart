import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthenticatedHttpClient with DioMixin implements Dio {
  AuthenticatedHttpClient() {
    options.baseUrl = "https://newsapi.org/v2";
    options.headers['Authorization'] = dotenv.get('NEWS_API_KEY');
  }
}

final authenticatedHttpClientProvider = Provider(
  (ref) => AuthenticatedHttpClient(),
);
