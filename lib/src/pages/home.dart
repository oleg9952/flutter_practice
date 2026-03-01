import 'package:flutter/material.dart';
import 'package:flutter_practice/src/common/models.dart';
import 'package:flutter_practice/src/common/widgets/navigation_grid.dart';
import 'package:flutter_practice/src/router/routes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<CategoryModel> categories = [
    CategoryModel(title: 'Buttons', path: AppRoute.buttons.path),
    CategoryModel(title: 'Forms', path: AppRoute.forms.path),
    CategoryModel(title: 'Layouts', path: AppRoute.layouts.path),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: NavigationGrid(items: categories, cardColor: Colors.black),
    );
  }
}
