import 'package:flutter/material.dart';
import 'package:muslems_app/constants/app_colors.dart';

class CustomWbuttonWidget extends StatelessWidget {
  const CustomWbuttonWidget({
    super.key,
    required this.onPressed,
    required this.name,
  });
  final void Function()? onPressed;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(minWidth: 120, minHeight: 100),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  AppColors.defaultColor, // Button background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              name,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ) //اذكار

            ),
      ),
    );
  }
}
