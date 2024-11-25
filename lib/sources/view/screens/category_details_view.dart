import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c12/common/widgets/error_widget.dart';
import 'package:news_app_c12/common/widgets/loading_widget.dart';
import 'package:news_app_c12/sources/model_view/sources_cubit.dart';
import 'package:news_app_c12/sources/model_view/sourses_state.dart';
import 'package:news_app_c12/sources/view/widgets/sources_list.dart';

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView({super.key, required this.id});
  final String id;

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  late SourcesCubit sourcesCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sourcesCubit = SourcesCubit();
    sourcesCubit.getSources(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocProvider(
            create: (context) => sourcesCubit,
            child: BlocBuilder<SourcesCubit, SourcesState>(
              builder: (_, value) {
                print('==>${value.runtimeType}');

                return value is SourcesLoadingState
                    ? const LoadingWidget()
                    : value is SourcesErrorState
                        ? CustomErrorWidget(errorMessage: value.errorMessage)
                        : value is SourcesSuccessState
                            ? SourcesList(sources: value.sourcesList)
                            : const SizedBox.shrink();
              },
            ))
      ],
    );
  }
}
