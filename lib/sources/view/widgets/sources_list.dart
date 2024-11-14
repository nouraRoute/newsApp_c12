import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c12/common/app_colors.dart';
import 'package:news_app_c12/sources/data/data_models/sources_model.dart';
import 'package:news_app_c12/news/view/widgets/news_list.dart';

class SourcesList extends StatefulWidget {
  const SourcesList({super.key, required this.sources});
  final List<Sources> sources;
  @override
  State<SourcesList> createState() => _SourcesListState();
}

class _SourcesListState extends State<SourcesList> {
  String? sectedSourceId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sectedSourceId = widget.sources.isNotEmpty ? widget.sources[0].id : null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 60.h,
            child: ListView.builder(
              itemCount: widget.sources.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: ChoiceChip(
                  onSelected: (value) {
                    sectedSourceId = widget.sources[index].id;
                    setState(() {});
                  },
                  label: Text(widget.sources[index].name ?? ''),
                  selected: widget.sources[index].id == sectedSourceId,
                  showCheckmark: false,
                  selectedColor: AppColors.mainColor,
                  labelStyle: TextStyle(
                      color: widget.sources[index].id == sectedSourceId
                          ? Colors.white
                          : AppColors.mainColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                      side: BorderSide(color: AppColors.mainColor)),
                ),
              ),
            )),
        if (sectedSourceId != null) NewsList(sourceId: sectedSourceId!)
      ],
    );
  }
}
