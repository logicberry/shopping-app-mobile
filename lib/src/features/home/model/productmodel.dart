import 'package:flutter/material.dart';
import 'package:shopapp/src/core/app_colors.dart';

class Product {
  final String name;
  final String image;
  final String company;
  final Color productBgColor;
  final double productPrice;
  final double initialPrice;

  Product({
    required this.name,
    required this.image,
    required this.company,
    required this.productBgColor,
    required this.productPrice,
    required this.initialPrice,
  });
}

List<Product> constantProducts = [
  Product(
    name: 'Imac 27 inch 5k',
    image: 'path_to_image1.jpg',
    company: 'Apple',
    productBgColor: AppColors.pink,
    productPrice: 29.99,
    initialPrice: 39.99,
  ),
  Product(
    name: 'Samsung zflip',
    image: 'path_to_image2.jpg',
    company: 'Samsung Store',
    productBgColor: AppColors.grey,
    productPrice: 19.99,
    initialPrice: 25.99,
  ),
  Product(
    name: 'Samsung zflip',
    image: 'path_to_image2.jpg',
    company: 'Samsung Store',
    productBgColor: AppColors.primaryColor,
    productPrice: 19.99,
    initialPrice: 25.99,
  ),
  Product(
    name: 'Samsung zflip',
    image: 'path_to_image2.jpg',
    company: 'Samsung Store',
    productBgColor: AppColors.secondaryColor,
    productPrice: 19.99,
    initialPrice: 25.99,
  ),
  Product(
    name: 'Samsung zflip',
    image: 'path_to_image2.jpg',
    company: 'Samsung Store',
    productBgColor: AppColors.secondaryColor,
    productPrice: 19.99,
    initialPrice: 25.99,
  ),
  Product(
    name: 'Samsung zflip',
    image: 'path_to_image2.jpg',
    company: 'Samsung Store',
    productBgColor: AppColors.secondaryColor,
    productPrice: 19.99,
    initialPrice: 25.99,
  ),
];
