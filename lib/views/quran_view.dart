import 'package:flutter/material.dart';
import 'package:muslems_app/constants/app_colors.dart';
import 'package:muslems_app/models/surah.dart';
import 'package:muslems_app/services/quran_services.dart';
import 'package:muslems_app/widgets/custom_shimmer.dart';
import 'package:muslems_app/widgets/quran_body.dart';
import 'package:muslems_app/widgets/surah_name_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});
  static String id = 'quraan_view';
  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  late Future<List<Surah>> suar;
  List<Surah> suarList = [];
  @override
  void initState() {
    suar = QuranServices().fetchSuras();
    _loadSuar();
    super.initState();
  }

  void _loadSuar() async {
    suarList = await suar;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                int index = prefs.getInt('last_surah') ?? 0;
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return QuranViewBody(surah: suarList[index]);
                }));
              },
              icon: const Icon(
                Icons.data_saver_on_rounded,
                color: Colors.white,
              ))
        ],
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.quranviewcolor,
        title: const Text(
          'القرآن الكريم',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Surah>>(
          future: suar,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CustomShimmer();
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              final List<Surah> suarNames = snapshot.data!;
              return ListView.builder(
                  itemCount: suarNames.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return QuranViewBody(surah: suarNames[i]);
                              },
                            ),
                          );
                        },
                        child: SurahNameWidget(surah: suarNames[i]));
                  });
            }
          }),
    );
  }
}



















// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:muslems_app/models/surah.dart';
// import 'package:muslems_app/services/quraan_services.dart';
// import 'package:muslems_app/widgets/custom_shimmer.dart';
// import 'package:muslems_app/widgets/surah_name_widget.dart';

// class QuraaView extends StatefulWidget {
//   static String id = 'quraanView';
//   const QuraaView({super.key});

//   @override
//   State<QuraaView> createState() => _QuraaViewState();
// }

// class _QuraaViewState extends State<QuraaView> {
//   late Future<List<Surah>> suar;
//   @override
//   void initState() {
//     // TODO: implement initState
//     suar = QuraanServices(dio: Dio()).fetchSurahs();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: FutureBuilder<List<Surah>>(
//               future: suar,
//               builder: (context, snaphot) {
//                 if (snaphot.connectionState == ConnectionState.waiting) {
//                   return const CustomShimmer();
//                 } else if (snaphot.hasError) {
//                   return Text(snaphot.error.toString());
//                 } else {
//                   final listOfSuar = snaphot.data!;
//                   return ListView.builder(
//                       itemCount: listOfSuar.length,
//                       itemBuilder: (context, i) {
//                         return SurahNameWidget(
//                           number: listOfSuar[i].number,
//                           numberOfAyahs: listOfSuar[i].numberOfAyahs,
//                             arabicSurahName: listOfSuar[i].arabicName,
//                             surahNameEnglish: listOfSuar[i].englishName,
//                             englishNameTranslation:
//                                 listOfSuar[i].englishNameTranslation);
//                       });
//                 }
//               })),
//     );
//   }
// }
