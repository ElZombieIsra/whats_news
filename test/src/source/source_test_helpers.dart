import 'package:whats_news/src/source/model/source_model.dart';

const mockSourcesJson = [
  {
    "id": "abc-news",
    "name": "ABC News",
    "description":
        "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
    "url": "https://abcnews.go.com",
    "category": "general",
    "language": "en",
    "country": "us"
  },
  {
    "id": "abc-news-au",
    "name": "ABC News (AU)",
    "description":
        "Australia's most trusted source of local, national and world news. Comprehensive, independent, in-depth analysis, the latest business, sport, weather and more.",
    "url": "http://www.abc.net.au/news",
    "category": "general",
    "language": "en",
    "country": "au"
  },
];

final sourcesMockModels = mockSourcesJson.map(SourceModel.fromJson).toList();
