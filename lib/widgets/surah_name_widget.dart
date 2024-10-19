import 'package:flutter/material.dart';
import 'package:muslems_app/constants/app_colors.dart';
import 'package:muslems_app/models/surah.dart';

class SurahNameWidget extends StatelessWidget {
  const SurahNameWidget({
    super.key,
    required this.surah,
  });

  final Surah surah;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        height: MediaQuery.of(context).size.height / 10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.quranviewcolor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  surah.number.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  surah.englishName,
                  style:
                      TextStyle(color: AppColors.quranviewcolor, fontSize: 18),
                ),
                Text(surah.englishNameTranslation),
              ],
            ),
            const Spacer(),
            Text(
              surah.arabicName,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ));
  }
}
