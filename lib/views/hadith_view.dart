// import 'package:muslems_app/constants/app_strings.dart';
// import 'package:muslems_app/widgets/hadith_body_widget.dart';
// import 'package:muslems_app/widgets/book_name_widget.dart';
// import 'package:flutter/material.dart';

// class HadithView extends StatelessWidget {
//   const HadithView({super.key});
//   static String id = 'HadithView';
//   static List<String> hadithesList = [
//     AppStrings.alSilsilaSahihaArab,
//     AppStrings.jamiAlTirmidhiArab,
//     AppStrings.mishkatAlMasabihArab,
//     AppStrings.musnadAhmadArab,
//     AppStrings.sahihMuslimArab,
//     AppStrings.sunanAbuDawoodArab,
//     AppStrings.sunanAnNasaiArab,
//     AppStrings.sunanIbnEMajahArab,
//     AppStrings.sahihBukhariArab,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.green,
//           title:const Text(
//             AppStrings.ahaddith,
//             style: TextStyle(
//                 fontFamily: 'ScheherazadeNew',
//                 fontSize: 24,
//                 color: Colors.white),
//           ),
//         ),
//         body: ListView.builder(
//             itemCount: hadithesList.length,
//             itemBuilder: (context, i) {
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.of(context)
//                       .push(MaterialPageRoute(builder: (context) {
//                     return HadithBodyWidget(bookNameArab: hadithesList[i]);
//                   }));
//                 },
//                 child: BookNameWidget(
//                   bookName: hadithesList[i],
//                 ),
//               );
//             }));
//   }
// }

import 'package:dio/dio.dart';
import 'package:muslems_app/constants/app_strings.dart';
import 'package:muslems_app/models/hadith_model.dart';
import 'package:muslems_app/services/hadith_services%20.dart';
import 'package:muslems_app/widgets/custom_shimmer.dart';
import 'package:muslems_app/widgets/hadith_widget.dart';
import 'package:flutter/material.dart';

class HadithView extends StatefulWidget {
  static String id = 'hadith_view';
  const HadithView({super.key});

  @override
  State<HadithView> createState() => _HadithBodyWidgetState();
}

class _HadithBodyWidgetState extends State<HadithView> {
  late Future<List<HadithModel>> ahadith;
  @override
  void initState() {
    ahadith = HadithServices(dio: Dio()).fetchAhadith();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          AppStrings.ahaddith,
          style: TextStyle(
            fontFamily: 'ScheherazadeNew',
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<HadithModel>>(
            future: ahadith,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CustomShimmer();
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                final ahadithData = snapshot.data!;
                return ListView.builder(
                    itemCount: ahadithData.length,
                    itemBuilder: (context, i) {
                      return HadithWidget(
                        hadithModel: ahadithData[i],
                      );
                    });
              }
            }),
      ),
    );
  }
}
