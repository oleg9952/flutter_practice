import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CategoryModel {
  final String title;
  final String path;

  const CategoryModel({required this.title, required this.path});
}

class ExampleItemModel {
  final String id;
  final String title;
  final Widget Function()? builder;

  ExampleItemModel({String? id, required this.title, this.builder})
    : id = id ?? const Uuid().v4();
}
