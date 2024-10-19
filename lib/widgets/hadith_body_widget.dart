import 'package:dio/dio.dart';
import 'package:muslems_app/models/hadith_model.dart';
import 'package:muslems_app/services/hadith_services%20.dart';
import 'package:muslems_app/widgets/custom_shimmer.dart';
import 'package:muslems_app/widgets/hadith_widget.dart';
import 'package:flutter/material.dart';

class HadithBodyWidget extends StatefulWidget {
  const HadithBodyWidget({super.key, required this.bookNameArab});
  final String bookNameArab;
  @override
  State<HadithBodyWidget> createState() => _HadithBodyWidgetState();
}

class _HadithBodyWidgetState extends State<HadithBodyWidget> {
  late Future<List<HadithModel>> ahadith;
  @override
  void initState() {
    ahadith = HadithServices(dio: Dio()).fetchAhadith();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

