import 'package:flutter/material.dart';

import '../../../core/core.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent(
      {super.key, required this.categoryName, required this.categoryImage});
  final String categoryName;
  final String categoryImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          child: Image.asset(categoryImage),
        ),
        Space.height(10),
        Text(categoryName, style: Theme.of(context).textTheme.bodyLarge)
      ],
    );
  }
}
