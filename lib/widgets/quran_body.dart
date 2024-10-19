import 'package:flutter/material.dart';
import 'package:muslems_app/constants/app_colors.dart';
import 'package:muslems_app/models/aya_model.dart';
import 'package:muslems_app/models/surah.dart';
import 'package:muslems_app/services/quran_services.dart';
import 'package:muslems_app/widgets/aya_widget.dart';
import 'package:muslems_app/widgets/custom_shimmer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranViewBody extends StatefulWidget {
  const QuranViewBody({super.key, required this.surah});
  final Surah surah;

  @override
  State<QuranViewBody> createState() => _QuranViewBodyState();
}

class _QuranViewBodyState extends State<QuranViewBody> {
  ScrollController scrollController = ScrollController();
  double scrollPosition = 0;
  double savedPosition = 0;
  late Future<List<AyaModel>> ayas;
  @override
  void initState() {
    ayas =
        QuranServices().fetchSurahsName(number: (widget.surah.number.toInt()));

    scrollController.addListener(() {
      scrollPosition = scrollController.position.pixels;
    });
    loadPosition();

    super.initState();
  }

  Future<void> savePosition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(
        //used when you click on surah .
        'scroll_position_of_${widget.surah.number}',
        scrollPosition);

    //for public if you want to go to the last surah
    prefs.setInt(
        'last_surah', widget.surah.number - 1); // widget.surah.number - 1
    //  as i save the index of widget in listview
  }

  Future<void> loadPosition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    savedPosition =
        await prefs.getDouble('scroll_position_of_${widget.surah.number}') ?? 0;

    if (savedPosition != 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollController.animateTo(savedPosition,
            duration: const Duration(seconds: 1), curve: Curves.easeInOut);
      });
    }
    //WidgetsBinding.instance.addPostFrameCallback
    //schedules the jump to the saved position to occur after the
    //current frame is built. This ensures that the ListView is
    //fully built before attempting to jump to the saved position
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                savePosition();
              },
              icon: const Icon(
                Icons.save_outlined,
                color: Colors.white,
              ))
        ],
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.quranviewcolor,
        title: Text(
          widget.surah.arabicName,
          style: const TextStyle(color: Colors.white, fontFamily: 'Me-Quran'),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<AyaModel>>(
            future: ayas,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CustomShimmer();
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                List<AyaModel> ayasList = snapshot.data!;
                return ListView.builder(
                    controller: scrollController,
                    itemCount: ayasList.length,
                    itemBuilder: (context, i) {
                      return AyaWidget(
                          aya: ayasList[i],
                          i: i,
                          surahName: widget.surah.arabicName);
                    });
              }
            }),
      ),
    );
  }
}
