import 'package:muslems_app/models/zkr_category_model.dart';
import 'package:flutter/material.dart';

class ZekrCategoryItemName extends StatelessWidget {
  const ZekrCategoryItemName({super.key, required this.item});
  final ZkrCategoryModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 5, // How wide the shadow should be
              blurRadius: 10, // How soft the shadow should be
              offset:
                  const Offset(0, 0), // Offset of the shadow from the container
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(item.image),
          ),
          Text(
            item.name,
            style: const TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}
