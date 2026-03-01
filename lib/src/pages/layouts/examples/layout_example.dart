import 'package:flutter/material.dart';

import '../../../common/constants.dart';
import '../../../common/models.dart';
import 'layout_1.dart';
import 'layout_2.dart';

final List<ExampleItemModel> layoutList = [
  ExampleItemModel(title: 'Web Layout', builder: () => Layout1()),
  ExampleItemModel(title: 'Practice Layout', builder: () => Layout2()),
];

class LayoutExample extends StatelessWidget {
  final String id;

  const LayoutExample({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final item = layoutList.firstWhere(
      (item) => item.id == id,
      orElse: () => EXAMPLE_FALLBACK,
    );

    return Scaffold(
      body: item.builder?.call() ?? EXAMPLE_FALLBACK.builder!.call(),
    );
  }
}
