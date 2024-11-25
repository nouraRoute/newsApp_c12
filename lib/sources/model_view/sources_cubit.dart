import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c12/common/service_locator.dart';
import 'package:news_app_c12/sources/data/data_models/sources_model.dart';
import 'package:news_app_c12/sources/model_view/sourses_state.dart';
import 'package:news_app_c12/sources/repository/sources_repository.dart';

class SourcesCubit extends Cubit<SourcesState> {
  SourcesRepository sourcesRepository;

  SourcesCubit()
      : sourcesRepository = SourcesRepository(ServiceLocator.sourcesDataSource),
        super(SourcesInitialState());
  Future getSources(String catID) async {
    emit(SourcesLoadingState());
    try {
      List<Sources> responce = await sourcesRepository.getSources(catID);
      emit(SourcesSuccessState(sourcesList: responce));
    } catch (e) {
      emit(SourcesErrorState(errorMessage: e.toString()));
    }
  }
}
// class SourcesProvider extends ChangeNotifier {
//   SourcesRepository sourcesRepository;
//   SourcesProvider()
//       : sourcesRepository = SourcesRepository(ServiceLocator.sourcesDataSource);
//   List<Sources>? sourcesList;
//   String? errorMessage;
//   bool waiting = false;
//   Future getSources(String catID) async {
//     waiting = true;
//     notifyListeners();
//     try {
//       List<Sources> responce = await sourcesRepository.getSources(catID);
//       sourcesList = responce;
//     } catch (e) {
//       errorMessage = e.toString();
//     }
//     waiting = false;
//     notifyListeners();
//   }
// }
