import 'package:news_app_c12/news/data/data_models/news_model/article.dart';
import 'package:news_app_c12/news/data/data_source/news_data_source.dart';

class NewsRepository {
  NewsDataSource dataSource;
  NewsRepository(this.dataSource);
  Future<List<Article>> getNews(String sourceId) async {
    print('====>${sourceId}');

    List<Article> responce = await dataSource.getNews(sourceId);
    return responce;
  }
}
//
