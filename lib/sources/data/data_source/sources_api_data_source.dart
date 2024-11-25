import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c12/api/api_consts.dart';
import 'package:news_app_c12/sources/data/data_models/sources_model.dart';
import 'package:news_app_c12/sources/data/data_source/sources_data_source.dart';

class SourcesApiDataSource extends SourcesDataSource {
  Future<List<Sources>> getSources(String categoryId) async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.sourcesEndpoint,
        {'apiKey': ApiConsts.apiKey, 'category': categoryId});
    var responce = await http.get(url);
    String body = responce.body;
    var json = jsonDecode(body);
    var newsResponce = SourceModel.fromJson(json);

    if (newsResponce.status == 'ok') {
      return newsResponce.sources ?? [];
    } else {
      throw Exception('Some thing went wrong');
    }
  }
}
