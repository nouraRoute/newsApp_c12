import 'package:flutter/material.dart';
import 'package:news_app_c12/common/service_locator.dart';
import 'package:news_app_c12/news/data/data_models/news_model/article.dart';
import 'package:news_app_c12/news/repository/news_repository.dart';

class NewsProvider extends ChangeNotifier {
  NewsRepository newsRepository = NewsRepository(
    ServiceLocator.newsDataSource,
  );
  List<Article>? newsList;
  String? errorMessage;
  bool waiting = false;
  Future getNews(String sourceId) async {
    print('====>${sourceId}');

    waiting = true;
    notifyListeners();
    try {
      List<Article> responce = await newsRepository.getNews(sourceId);
      newsList = responce;
    } catch (e) {
      errorMessage = e.toString();
    }
    waiting = false;
    notifyListeners();
  }
}
