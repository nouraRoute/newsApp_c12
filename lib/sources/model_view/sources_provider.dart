import 'package:flutter/material.dart';
import 'package:news_app_c12/common/service_locator.dart';
import 'package:news_app_c12/sources/data/data_models/sources_model.dart';
import 'package:news_app_c12/sources/repository/sources_repository.dart';

class SourcesProvider extends ChangeNotifier {
  SourcesRepository sourcesRepository;
  SourcesProvider()
      : sourcesRepository = SourcesRepository(ServiceLocator.sourcesDataSource);
  List<Sources>? sourcesList;
  String? errorMessage;
  bool waiting = false;
  Future getSources(String catID) async {
    waiting = true;
    notifyListeners();
    try {
      List<Sources> responce = await sourcesRepository.getSources(catID);
      sourcesList = responce;
    } catch (e) {
      errorMessage = e.toString();
    }
    waiting = false;
    notifyListeners();
  }
}
