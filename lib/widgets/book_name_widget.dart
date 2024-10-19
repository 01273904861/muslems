import 'package:flutter/material.dart';
import 'package:muslems_app/constants/app_colors.dart';

class BookNameWidget extends StatelessWidget {
  const BookNameWidget({
    super.key,
    required this.bookName,
  });
  final String bookName;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.defaultColor,
          borderRadius: BorderRadius.circular(50),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        height: MediaQuery.of(context).size.height / 10,
        width: MediaQuery.of(context).size.width * 1 / 3,
        child: Center(
          child: Text(
            bookName,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ));
  }
}
