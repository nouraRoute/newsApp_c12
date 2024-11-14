import 'package:flutter/material.dart';
import 'package:news_app_c12/news/data/data_models/news_model/news_model.dart';
import 'package:news_app_c12/news/data/data_source/data_source.dart';

class NewsProvider extends ChangeNotifier {
  DataSource dataSource = DataSource();
  NewsModel? newsModel;
  String? errorMessage;
  bool waiting = false;
  Future getNews(String sourceId) async {
    print('====>${sourceId}');

    waiting = true;
    notifyListeners();
    try {
      NewsModel responce = await dataSource.getNews(sourceId);
      newsModel = responce;
      if (responce.status != 'ok') {
        errorMessage = responce.status;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    waiting = false;
    notifyListeners();
  }
}
