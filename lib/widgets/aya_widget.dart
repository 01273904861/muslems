import 'package:muslems_app/constants/app_strings.dart';
import 'package:muslems_app/models/aya_model.dart';
import 'package:flutter/material.dart';

class AyaWidget extends StatelessWidget {
  const AyaWidget({
    super.key,
    required this.aya,
    required this.i,
    required this.surahName,
  });
  final AyaModel aya;
  final int i;
  final String surahName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Card(
            child: Text(
              AppStrings.rightSign +
                  (i + 1).toString() +
                  AppStrings.leftSign +
                  aya.text,
              style: TextStyle(
                color: Colors.black.withOpacity(.8),
                fontSize: 22,
                fontFamily: 'Me-Quran',
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
