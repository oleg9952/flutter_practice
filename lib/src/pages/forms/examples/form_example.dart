import 'package:flutter/material.dart';

import '../../../common/models.dart';
import 'form_1.dart';
import 'form_2.dart';

final List<ExampleItemModel> formsList = [
  ExampleItemModel(title: 'Auth 1', builder: () => Form1()),
  ExampleItemModel(title: 'Placeholder', builder: () => Form2()),
];

final FALLBACK = ExampleItemModel(
  id: '0',
  title: 'Empty',
  builder: () => Center(child: Text('Empty')),
);

class FormExample extends StatelessWidget {
  final String id;

  const FormExample({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final item = formsList.firstWhere(
      (item) => item.id == id,
      orElse: () => FALLBACK,
    );

    return Scaffold(body: item.builder?.call() ?? FALLBACK.builder!.call());
  }
}
