// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news_app_c12/screens/category/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(this.categoryModel, this.index, {super.key});
  final CategoryModel categoryModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: categoryModel.color,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(25),
              topRight: const Radius.circular(25),
              bottomLeft: index.isEven
                  ? const Radius.circular(25)
                  : const Radius.circular(0),
              bottomRight: index.isOdd
                  ? const Radius.circular(25)
                  : const Radius.circular(0),
            )),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              categoryModel.imagePath,
              height: 120.h,
              fit: BoxFit.contain,
            ),
            Text(
              categoryModel.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 22.sp, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
