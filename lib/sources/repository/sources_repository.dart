import 'package:news_app_c12/sources/data/data_models/sources_model.dart';
import 'package:news_app_c12/sources/data/data_source/sources_data_source.dart';

class SourcesRepository {
  SourcesDataSource sourcesDataSource;
  SourcesRepository(this.sourcesDataSource);
  Future<List<Sources>> getSources(String categoryId) async {
    return await sourcesDataSource.getSources(categoryId);
  }
}
