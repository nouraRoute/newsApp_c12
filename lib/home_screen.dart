import 'package:flutter/material.dart';
import 'package:news_app_c12/common/app_assets.dart';
import 'package:news_app_c12/common/widgets/custom_drawer.dart';
import 'package:news_app_c12/screens/category/categories_view.dart';
import 'package:news_app_c12/screens/category/category_details_view.dart';
import 'package:news_app_c12/screens/category/models/category_model.dart';
import 'package:news_app_c12/screens/settings/settings_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItem selectedView = DrawerItem.categories;

  CategoryModel? selectedCat;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(AppAssets.patternImage), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: CustomDrawer(
            onSelect: (p0) {
              selectedView = p0;
              selectedCat = null;
              setState(() {});
            },
          ),
          appBar: AppBar(
            title: selectedCat != null
                ? Text(selectedCat!.title)
                : selectedView == DrawerItem.setting
                    ? const Text('Settings')
                    : const Text('News App'),
            actions: selectedCat != null
                ? [
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                    const SizedBox(
                      width: 10,
                    )
                  ]
                : null,
          ),
          body: selectedCat != null
              ? CategoryDetailsView(id: selectedCat!.id)
              : selectedView == DrawerItem.categories
                  ? CategoriesView(
                      onSelect: (p0) {
                        selectedCat = p0;
                        setState(() {});
                      },
                    )
                  : const SettingsView()),
    );
  }
}
