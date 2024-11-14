import 'package:flutter/material.dart';
import 'package:news_app_c12/sources/data/data_source/data_source.dart';
import 'package:news_app_c12/sources/data/data_models/sources_model.dart';

class SourcesProvider extends ChangeNotifier {
  DataSource dataSource = DataSource();
  SourceModel? sourceModel;
  String? errorMessage;
  bool waiting = false;
  Future getSources(String catID) async {
    waiting = true;
    notifyListeners();
    try {
      SourceModel responce = await dataSource.getSources(catID);
      sourceModel = responce;
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
