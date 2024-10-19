import 'package:muslems_app/constants/app_colors.dart';
import 'package:muslems_app/constants/app_strings.dart';
import 'package:muslems_app/widgets/custom_gridview.dart';
import 'package:flutter/material.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});
  static String id = 'azkar_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            AppStrings.todayAzkar,
            style: TextStyle(
              fontSize: 24 ,
              color: Colors.white,
            ),
          ),
          backgroundColor: AppColors.quranviewcolor,
        ),
        body: const CustomGridView());
  }
}
