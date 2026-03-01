import 'package:flutter_practice/src/pages/layouts/examples/layout_example.dart';
import 'package:flutter_practice/src/pages/layouts/layouts.dart';
import 'package:go_router/go_router.dart';

import '../pages/buttons/buttons.dart';
import '../pages/forms/examples/form_example.dart';
import '../pages/forms/forms.dart';
import '../pages/home.dart';

enum AppRoute {
  home('/'),

  buttons('/buttons'),

  forms('/forms'),
  specificForm('/forms/:id'),

  layouts('/layouts'),
  specificLayout('/layouts/:id');

  final String path;

  const AppRoute(this.path);

  String withParam(String value) => path.replaceFirst(RegExp(r':\w+'), value);
}

final appRouter = GoRouter(
  initialLocation: AppRoute.home.path,
  routes: [
    GoRoute(path: AppRoute.home.path, builder: (context, state) => HomePage()),
    GoRoute(
      path: AppRoute.buttons.path,
      builder: (context, state) => ButtonPage(),
    ),

    GoRoute(
      path: AppRoute.forms.path,
      builder: (context, state) => FormsPage(),
    ),
    GoRoute(
      path: AppRoute.specificForm.path,
      builder: (context, state) => FormExample(id: state.pathParameters['id']!),
    ),

    GoRoute(
      path: AppRoute.layouts.path,
      builder: (context, state) => LayoutsPage(),
    ),
    GoRoute(
      path: AppRoute.specificLayout.path,
      builder: (context, state) =>
          LayoutExample(id: state.pathParameters['id']!),
    ),
  ],
);
