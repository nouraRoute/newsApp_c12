import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c12/api/api_consts.dart';
import 'package:news_app_c12/news/data/data_models/news_model/news_model.dart';

class DataSource {
  Future<NewsModel> getNews(String sourceId) async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.newsEndpoint,
        {'apiKey': ApiConsts.apiKey, 'sources': sourceId});
    var responce = await http.get(url);
    String body = responce.body;
    var json = jsonDecode(body);
    return NewsModel.fromJson(json);
  }
}
