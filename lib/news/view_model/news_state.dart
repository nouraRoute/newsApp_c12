// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:news_app_c12/news/data/data_models/news_model/article.dart';

abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsErrorState extends NewsState {
  String errorMessage;
  NewsErrorState({
    required this.errorMessage,
  });
}

class NewsLoadingState extends NewsState {}

class NewsSuccessState extends NewsState {
  List<Article> articlesList;
  NewsSuccessState({
    required this.articlesList,
  });
}
