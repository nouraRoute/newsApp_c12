import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c12/api/api_servoces.dart';
import 'package:news_app_c12/common/app_colors.dart';
import 'package:news_app_c12/screens/category/models/sources_model.dart';

class SourcesList extends StatefulWidget {
  const SourcesList({super.key, required this.categoryId});
  final String categoryId;

  @override
  State<SourcesList> createState() => _SourcesListState();
}

class _SourcesListState extends State<SourcesList> {
  String? selectedSubCatId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getSources(widget.categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('error:${snapshot.error.toString()}'),
          );
        }
        SourceModel? sourceModel = snapshot.data;
        List<Sources> sources = sourceModel?.sources ?? [];
        if (selectedSubCatId == null && sources.isNotEmpty) {
          selectedSubCatId = sources[0].id;
        }
        return SizedBox(
            height: 60.h,
            child: ListView.builder(
              itemCount: sources.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: ChoiceChip(
                  onSelected: (value) {
                    selectedSubCatId = sources[index].id;
                    setState(() {});
                  },
                  label: Text(sources[index].name ?? ''),
                  selected: sources[index].id == selectedSubCatId,
                  showCheckmark: false,
                  selectedColor: AppColors.mainColor,
                  labelStyle: TextStyle(
                      color: sources[index].id == selectedSubCatId
                          ? Colors.white
                          : AppColors.mainColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                      side: BorderSide(color: AppColors.mainColor)),
                ),
              ),
            ));
      },
    );
  }
}
