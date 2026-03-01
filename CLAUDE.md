# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

A personal Flutter practice/sandbox app for exploring widgets, layouts, and forms. It targets all platforms (android, ios, web, macos, linux, windows) but is developed primarily as a learning exercise — expect example/exercise code (see the `SectionHead` prompts in `buttons.dart`) rather than production concerns.

## Commands

```bash
flutter pub get              # install dependencies
flutter run                  # run on a connected device/simulator (add -d chrome for web, -d macos, etc.)
flutter analyze              # static analysis (uses flutter_lints via analysis_options.yaml)
flutter test                 # run all tests
flutter test test/some_test.dart   # run a single test file
```

There is no `test/` directory yet — `flutter test` currently has nothing to run.

## Architecture

### Routing

Navigation is centralized in `lib/src/router/routes.dart` using `go_router`. Routes are declared through an `AppRoute` enum where each case carries its path string:

```dart
enum AppRoute {
  home('/'),
  buttons('/buttons'),
  forms('/forms'),
  specificForm('/forms/:id'),
  ...
}
```

`AppRoute.withParam(value)` substitutes a `:param` segment to build a concrete link (e.g. `AppRoute.specificForm.withParam(item.id)`). Every route referenced from a `GoRoute` in `appRouter` must have a matching `AppRoute` case.

### Category → examples pattern

Content is organized as top-level categories (`buttons`, `forms`, `layouts`) under `lib/src/pages/`. `forms` and `layouts` follow an identical two-level pattern:

1. **List page** (`pages/<category>/<category>.dart`) — builds a `List<CategoryModel>` from a static `<category>List` (e.g. `formsList`, `layoutList`) and renders it with the shared `NavigationGrid` widget. Tapping a card pushes to `AppRoute.specific<Category>.withParam(item.id)`.
2. **Example resolver** (`pages/<category>/examples/<category>_example.dart`) — defines `<category>List` as a `List<ExampleItemModel>`, where each item has an auto-generated `id` (uuid), a `title`, and a `builder` returning the actual example widget. The resolver widget (e.g. `FormExample`, `LayoutExample`) looks up the item by `id` from the route's path parameter and calls its `builder`, falling back to an empty placeholder if not found.
3. **Individual examples** live as sibling files in `examples/` (e.g. `form_1.dart`, `form_2.dart`, `layout_1.dart`, `layout_2.dart`) and are plain widgets referenced only by the resolver's list.

`buttons` is simpler — a single page (`pages/buttons/buttons.dart`) with inline widget examples plus one custom component (`pages/buttons/custom/pill_button.dart`), no per-item routing.

To add a new example to `forms` or `layouts`: create the example widget file, add an `ExampleItemModel` entry to that category's list in the `examples/*_example.dart` file — the id and route wiring are automatic.

To add a whole new category: add `AppRoute` cases (list + `:id` detail) in `routes.dart`, add corresponding `GoRoute`s, create the `pages/<category>/<category>.dart` + `examples/<category>_example.dart` pair following the pattern above, and register it in `HomePage.categories` (`lib/src/pages/home.dart`).

### Shared building blocks (`lib/src/common/`)

- `models.dart` — `CategoryModel` (title + path, used for grid navigation) and `ExampleItemModel` (id/title/builder, used by the category→examples pattern).
- `constants.dart` — `EXAMPLE_FALLBACK`, the shared empty-state item used when an example `id` can't be resolved. Note: `forms_example.dart` currently defines its own local `FALLBACK` instead of reusing this — be aware both exist when touching that file.
- `widgets/navigation_grid.dart` — 2-column `GridView` of tappable cards driven by `List<CategoryModel>`; used by the home page and every category list page.
- `widgets/section_head.dart` — section heading widget used to label groups of examples/exercises within a page (see `buttons.dart`).
