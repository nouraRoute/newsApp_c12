// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:news_app_c12/sources/data/data_models/sources_model.dart';

abstract class SourcesState {}

class SourcesInitialState extends SourcesState {}

class SourcesLoadingState extends SourcesState {}

class SourcesErrorState extends SourcesState {
  String errorMessage;
  SourcesErrorState({
    required this.errorMessage,
  });
}

class SourcesSuccessState extends SourcesState {
  List<Sources> sourcesList;
  SourcesSuccessState({
    required this.sourcesList,
  });
}
