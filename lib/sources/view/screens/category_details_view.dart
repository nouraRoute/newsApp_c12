import 'package:flutter/material.dart';
import 'package:news_app_c12/common/widgets/error_widget.dart';
import 'package:news_app_c12/common/widgets/loading_widget.dart';
import 'package:news_app_c12/sources/model_view/sources_provider.dart';
import 'package:news_app_c12/sources/view/widgets/sources_list.dart';
import 'package:provider/provider.dart';

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView({super.key, required this.id});
  final String id;

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  late SourcesProvider sourcesProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sourcesProvider = SourcesProvider();
    sourcesProvider.getSources(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChangeNotifierProvider(
            create: (context) => sourcesProvider,
            child: Consumer<SourcesProvider>(
              builder: (_, value, child) => value.waiting
                  ? LoadingWidget()
                  : value.errorMessage != null
                      ? CustomErrorWidget(errorMessage: value.errorMessage!)
                      : SourcesList(sources: value.sourceModel?.sources ?? []),
            ))
      ],
    );
  }
}
