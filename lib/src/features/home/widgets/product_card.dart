import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String company;
  final String productPrice;
  final String initialPrice;
  final Color productBgColor;
  const ProductCard(
      {super.key,
      required this.productName,
      required this.company,
      required this.productPrice,
      required this.initialPrice, required this.productBgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Container(
            color: productBgColor,
            child: Expanded(
              child: Image.asset(
                'assets/images/iphone.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(productName),
          Row(
            children: [
              Text(company),
              Space.width(10),
              const Icon(Icons.favorite_border),
            ],
          ),
          Row(
            children: [Text('\$ $productPrice'), Text('\$ $initialPrice')],
          ),
        ],
      ),
    );
  }
}
