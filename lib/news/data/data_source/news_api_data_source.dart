import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c12/api/api_consts.dart';
import 'package:news_app_c12/news/data/data_models/news_model/article.dart';
import 'package:news_app_c12/news/data/data_models/news_model/news_model.dart';
import 'package:news_app_c12/news/data/data_source/news_data_source.dart';

class NewsApiDataSource extends NewsDataSource {
  @override
  Future<List<Article>> getNews(String sourceId) async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.newsEndpoint,
        {'apiKey': ApiConsts.apiKey, 'sources': sourceId});
    var responce = await http.get(url);
    String body = responce.body;
    var json = jsonDecode(body);
    var newsResponce = NewsModel.fromJson(json);
    if (newsResponce.status == 'ok') {
      return newsResponce.articles ?? [];
    } else {
      throw Exception(newsResponce.status);
    }
  }
}
