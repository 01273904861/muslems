import 'package:flutter/material.dart';
import 'package:muslems_app/models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            categoryModel.image,
            width: 100,
            height: 100,
          ),
          Text(
            categoryModel.title,
            style: const TextStyle(
                fontSize: 21, fontFamily: 'Me-Quran', color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                categoryModel.subtitle,
                style: const TextStyle(
                    fontSize: 18, fontFamily: 'Quran', color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
