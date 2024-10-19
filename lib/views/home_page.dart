import 'package:flutter/material.dart';
import 'package:muslems_app/constants/app_assets.dart';
import 'package:muslems_app/constants/app_strings.dart';
import 'package:muslems_app/models/category_model.dart';
import 'package:muslems_app/views/azkar_view.dart';
import 'package:muslems_app/views/hadith_view.dart';
import 'package:muslems_app/views/quran_view.dart';
import 'package:muslems_app/widgets/category_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });
  static String id = 'home_page';
  static const List<CategoryModel> categorys = [
    CategoryModel(
        color: Color.fromARGB(255, 242, 112, 155),
        image: AppAssets.assetsImageQuran,
        subtitle: 'اذهب الى',
        title: AppStrings.quranKareem),
    CategoryModel(
        color: Color.fromARGB(255, 130, 100, 137),
        image: AppAssets.assetsImageHadith,
        subtitle: 'اذهب الى',
        title: AppStrings.ahaddith),
    CategoryModel(
        color: Color.fromARGB(255, 114, 134, 152),
        image: AppAssets.assetsImagesPrayer,
        subtitle: 'اذهب الى',
        title: AppStrings.todayAzkar),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'مسلمونا',
            style: TextStyle(
                fontFamily: 'ScheherazadeNew',
                fontSize: 24,
                color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8, right: 12, left: 12),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
              itemCount: categorys.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                    onTap: () {
                      switch (categorys[i].title) {
                        case AppStrings.quranKareem:
                          Navigator.pushNamed(context, QuranView.id);
                        case AppStrings.ahaddith:
                          Navigator.pushNamed(context, HadithView.id);
                        case AppStrings.todayAzkar:
                          Navigator.pushNamed(context, AzkarView.id);
                      }
                    },
                    child: CategoryWidget(categoryModel: categorys[i]));
              }),
        ));
  }
}

// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Quran App'),
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(16),
//         children: [
//           SurahCard(
//             surahName: 'Al-Faatiha',
//             ayahs: [
//               {'number': 1, 'text': 'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ'},
//               {'number': 2, 'text': 'ٱلْحَمْدُ لِلَّهِ رَبِّ ٱلْعَٰلَمِينَ'},
//               {'number': 3, 'text': 'ٱلرَّحْمَٰنِ ٱلرَّحِيمِ'},
//               {'number': 4, 'text': 'مَٰلِكِ يَوْمِ ٱلدِّينِ'},
//               {'number': 5, 'text': 'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ'},
//               {'number': 6, 'text': 'ٱهْدِنَا ٱلصِّرَٰطَ ٱلْمُسْتَقِيمَ'},
//               {
//                 'number': 7,
//                 'text':
//                     'صِرَٰطَ ٱلَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ ٱلْمَغْضُوبِ عَلَيْهِمْ وَلَا ٱلضَّآلِّينَ'
//               },
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SurahCard extends StatelessWidget {
//   final String surahName;
//   final List<Map<String, dynamic>> ayahs;

//   SurahCard({required this.surahName, required this.ayahs});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               surahName,
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16),
//             for (var ayah in ayahs)
//               Text(
//                 "{\uFD3E}" +
//                     ayah['number'].toString() +
//                     "\uFD3F" +
//                     ayah['text'].toString(),
//                 style: TextStyle(fontSize: 20, fontFamily: 'Me-Quran'),
//                 textAlign: TextAlign.right,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
