import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c12/common/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.onSelect});
  final Function(DrawerItem) onSelect;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 320.w,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.zero),
      child: Column(
        children: [
          Container(
            height: 140.h,
            color: AppColors.mainColor,
            alignment: Alignment.center,
            child: Text(
              'News App!', //TODO:localization
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ListTile(
            onTap: () {
              onSelect(DrawerItem.categories);
              Navigator.of(context).pop();
            },
            leading: const Icon(
              Icons.list,
              size: 30,
            ),
            title: Text(
              'Categories', //TODO:localization
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
          ListTile(
            onTap: () {
              onSelect(DrawerItem.setting);
              Navigator.of(context).pop();
            },
            leading: const Icon(
              Icons.settings,
              size: 30,
            ),
            title: Text(
              'settings', //TODO:localization
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

enum DrawerItem { setting, categories }
