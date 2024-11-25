import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c12/common/service_locator.dart';
import 'package:news_app_c12/news/data/data_models/news_model/article.dart';
import 'package:news_app_c12/news/repository/news_repository.dart';
import 'package:news_app_c12/news/view_model/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  late NewsRepository newsRepository;
  NewsCubit() : super(NewsInitialState()) {
    newsRepository = NewsRepository(
      ServiceLocator.newsDataSource,
    );
  }

  Future<void> getNews(String sourceId) async {
    print('====>${sourceId}');

    emit(NewsLoadingState());
    try {
      List<Article> responce = await newsRepository.getNews(sourceId);
      //newsList = responce;
      emit(NewsSuccessState(articlesList: responce));
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}

// class NewsProvider extends ChangeNotifier {
//   NewsRepository newsRepository = NewsRepository(
//     ServiceLocator.newsDataSource,
//   );
//   List<Article>? newsList;
//   String? errorMessage;
//   bool waiting = false;
//   Future getNews(String sourceId) async {
//     print('====>${sourceId}');

//     waiting = true;
//     notifyListeners();
//     try {
//       List<Article> responce = await newsRepository.getNews(sourceId);
//       newsList = responce;
//     } catch (e) {
//       errorMessage = e.toString();
//     }
//     waiting = false;
//     notifyListeners();
//   }
// }
