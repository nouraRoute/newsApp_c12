import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c12/common/app_assets.dart';
import 'package:news_app_c12/screens/category/category_card.dart';
import 'package:news_app_c12/screens/category/models/category_model.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.onSelect});
  final Function(CategoryModel) onSelect;
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
          id: 'sports',
          imagePath: AppAssets.ballImage,
          title: 'Sports',
          color: Colors.red),
      CategoryModel(
          id: 'health',
          imagePath: AppAssets.healthImage,
          title: 'Health',
          color: const Color(0xffED1E79)),
      CategoryModel(
          id: 'business',
          imagePath: AppAssets.bussinesImage,
          title: 'Business',
          color: const Color(0xffCF7E48)),
      CategoryModel(
          id: 'science',
          imagePath: AppAssets.scienceImage,
          title: 'Science',
          color: const Color(0xffF2D352))
    ];
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 35.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick your category\nof interest',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 170.h,
                    crossAxisSpacing: 25.w,
                    mainAxisSpacing: 20.h,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () => onSelect(categories[index]),
                    child: CategoryCard(categories[index], index)),
                itemCount: categories.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
