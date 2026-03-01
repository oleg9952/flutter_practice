import 'package:flutter/material.dart';
import 'package:flutter_practice/src/common/widgets/navigation_grid.dart';

import '../../common/models.dart';
import '../../router/routes.dart';
import 'examples/layout_example.dart';

class LayoutsPage extends StatefulWidget {
  const LayoutsPage({super.key});

  @override
  State<LayoutsPage> createState() => _LayoutsPageState();
}

class _LayoutsPageState extends State<LayoutsPage> {
  @override
  Widget build(BuildContext context) {
    final layoutExamples = layoutList
        .map(
          (item) => CategoryModel(
            title: item.title,
            path: AppRoute.specificLayout.withParam(item.id),
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text('Layouts')),
      body: NavigationGrid(items: layoutExamples, cardColor: Colors.black),
    );
  }
}
