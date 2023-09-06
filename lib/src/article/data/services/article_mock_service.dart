import 'package:whats_news/src/article/data/services/article_service.dart';
import 'package:whats_news/src/article/model/article_model.dart';

final articlesJson = [
  {
    "source": {"id": null, "name": "[Removed]"},
    "author": null,
    "title": "[Removed]",
    "description": "[Removed]",
    "url": "https://removed.com",
    "urlToImage": null,
    "publishedAt": "1970-01-01T00:00:00Z",
    "content": "[Removed]"
  },
  {
    "source": {
      "id": "the-wall-street-journal",
      "name": "The Wall Street Journal"
    },
    "author": "Shannon Najmabadi, Erin Mulvaney",
    "title":
        "Texas Attorney General Ken Paxton Impeachment Trial Starts - The Wall Street Journal",
    "description": "Flamboyant lawyers clash in the Lone Star Capitol",
    "url":
        "https://www.wsj.com/politics/texas-impeachment-trial-attorney-general-ken-paxton-7d751bf3",
    "urlToImage": "https://images.wsj.net/im-847128/social",
    "publishedAt": "2023-09-05T22:12:00Z",
    "content": null
  },
  {
    "source": {"id": "cnn", "name": "CNN"},
    "author": "George Ramsay, Patrick Sung, Ben Morse",
    "title":
        "Spain women’s soccer team appoints first female coach after predecessor fired amid unwanted World Cup kiss fallout - CNN",
    "description":
        "The Spanish women’s soccer team appointed its first ever female head coach after her predecessor was fired on the same day amid ongoing fallout over an unwanted kiss given by soccer chief Luis Rubiales to a player at the Women’s World Cup final.",
    "url":
        "https://www.cnn.com/2023/09/05/football/jorge-vilda-sacked-spain-coach-rfef-spt-intl/index.html",
    "urlToImage":
        "https://media.cnn.com/api/v1/images/stellar/prod/230901125155-01-jorge-vilda-luis-rubiales.jpg?c=16x9&q=w_800,c_fill",
    "publishedAt": "2023-09-05T22:08:00Z",
    "content":
        "The Spanish womens soccer team appointed its first ever female head coach after her predecessor was fired on the same day amid ongoing fallout over an unwanted kiss given by soccer chief Luis Rubiale… [+5330 chars]"
  },
  {
    "source": {"id": null, "name": "CBS Sports"},
    "author": "",
    "title":
        "Chiefs' Travis Kelce hyperextends knee, status reportedly in doubt for Week 1 matchup vs. Lions - CBS Sports",
    "description":
        "Kelce was injured at Tuesday's practice; the Lions-Chiefs line has fallen more than a point",
    "url":
        "https://www.cbssports.com/nfl/news/chiefs-travis-kelce-hyperextends-knee-status-reportedly-in-doubt-for-week-1-matchup-vs-lions/",
    "urlToImage":
        "https://sportshub.cbsistatic.com/i/r/2023/04/11/151c2558-417d-4a1c-a20f-ea7d745a5099/thumbnail/1200x675/c8a18c7818db77f6e7c480823228762d/travis-kelce-5-1400-us.jpg",
    "publishedAt": "2023-09-05T22:02:00Z",
    "content":
        "The reigning Super Bowl champion Kansas City Chiefs could be without one of their most important players when they kick off the 2023 regular season against the Detroit Lions on Thursday night. Follow… [+2725 chars]"
  }
];

class ArticleMockService implements ArticleService {
  @override
  Future<List<ArticleModel>> fetch() async {
    final articles =
        articlesJson.map((json) => ArticleModel.fromJson(json)).toList();
    return articles;
  }
}
