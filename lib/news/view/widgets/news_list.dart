import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c12/common/widgets/error_widget.dart';
import 'package:news_app_c12/common/widgets/loading_widget.dart';
import 'package:news_app_c12/news/view_model/news_cubit.dart';
import 'package:news_app_c12/news/view/widgets/news_card.dart';
import 'package:news_app_c12/news/view_model/news_state.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.sourceId});
  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  late NewsCubit newsCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsCubit = NewsCubit();
    newsCubit.getNews(widget.sourceId);
  }

  @override
  void didUpdateWidget(covariant NewsList oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    newsCubit.getNews(widget.sourceId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => newsCubit,
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          print('==>${state.runtimeType}');
          if (state is NewsLoadingState) {
            return const LoadingWidget();
          } else if (state is NewsErrorState) {
            return CustomErrorWidget(errorMessage: state.errorMessage);
          } else if (state is NewsSuccessState) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.articlesList.length,
              itemBuilder: (context, index) => NewsCard(
                newsModel: state.articlesList[index],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
