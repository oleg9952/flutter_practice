import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models.dart';

class NavigationGrid extends StatelessWidget {
  final Color? cardColor;
  final double? titleSize;
  final List<CategoryModel> items;

  const NavigationGrid({
    super.key,
    this.cardColor,
    required this.items,
    this.titleSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return Card(
          elevation: 3,
          color: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => context.push(item.path),
            child: Center(
              child: Text(
                item.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
