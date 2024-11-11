import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c12/api/api_consts.dart';
import 'package:news_app_c12/screens/category/models/sources_model.dart';

class ApiService {
  static Future<SourceModel> getSources(String categoryId) async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.sourcesEndpoint,
        {'apiKey': ApiConsts.apiKey, 'category': categoryId});
    var responce = await http.get(url);
    String body = responce.body;
    var json = jsonDecode(body);
    return SourceModel.fromJson(json);
  }
}
