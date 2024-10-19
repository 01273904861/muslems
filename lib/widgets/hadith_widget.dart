import 'package:muslems_app/models/hadith_model.dart';
import 'package:flutter/material.dart';

class HadithWidget extends StatelessWidget {
  const HadithWidget({
    super.key,
    required this.hadithModel,
  });
  final HadithModel hadithModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Shadow color
              blurRadius: 4,
              offset: const Offset(0, 10), //x , y
              spreadRadius: 10,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (hadithModel.nameArabic != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                hadithModel.nameArabic!,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontFamily: 'ScheherazadeNew',
                ),
              ),
            ),
          Text(
            hadithModel.hadithArabic,
            style: const TextStyle(
              color: Color.fromARGB(255, 102, 101, 101),
              fontSize: 22,
              fontFamily: 'ScheherazadeNew',
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
