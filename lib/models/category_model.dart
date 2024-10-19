import 'package:flutter/material.dart';

class CategoryModel {
  final String title;
  final String subtitle;
  final String image;
  final Color color;

  const CategoryModel(
      {required this.color,
      required this.image,
      required this.subtitle,
      required this.title});
}
