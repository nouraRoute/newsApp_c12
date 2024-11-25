import 'package:news_app_c12/news/data/data_source/news_api_data_source.dart';
import 'package:news_app_c12/news/data/data_source/news_data_source.dart';
import 'package:news_app_c12/sources/data/data_source/sources_api_data_source.dart';
import 'package:news_app_c12/sources/data/data_source/sources_data_source.dart';

class ServiceLocator {
  static NewsDataSource newsDataSource = NewsApiDataSource();
  static SourcesDataSource sourcesDataSource = SourcesApiDataSource();
}
