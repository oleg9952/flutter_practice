import 'package:flutter/material.dart';

import '../../common/models.dart';
import '../../common/widgets/navigation_grid.dart';
import '../../router/routes.dart';
import 'examples/form_example.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final forms = formsList
        .map(
          (formItem) => CategoryModel(
            title: formItem.title,
            path: AppRoute.specificForm.withParam(formItem.id),
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text('Forms')),
      body: NavigationGrid(items: forms, cardColor: Colors.black),
    );
  }
}
