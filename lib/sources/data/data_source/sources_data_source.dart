import 'package:news_app_c12/sources/data/data_models/sources_model.dart';

abstract class SourcesDataSource {
  Future<List<Sources>> getSources(String categoryId);
}
