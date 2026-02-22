import 'package:flutter/material.dart';

import 'src/pages/buttons/buttons.dart';
import 'src/pages/layouts/layouts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Test',
      debugShowCheckedModeBanner: false,
      // home: Buttons(),
      home: Layouts(),
    );
  }
}
