import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:muslems_app/models/aya_model.dart';
import 'package:muslems_app/models/surah.dart';

class QuranServices {
  Future<Map<String, dynamic>> loadAndDecodeFile() async {
    final String data = await rootBundle.loadString('assets/quran.json');
    Map<String, dynamic> jsonData = jsonDecode(data);
    return jsonData;
  }

  Future<List<AyaModel>> fetchSurahsName({required int number}) async {
    try {
      Map<String, dynamic> jsonData = await loadAndDecodeFile();

      List<dynamic> listData = jsonData['data']['surahs'][number - 1]['ayahs'];
      List<AyaModel> listAyas =
          listData.map((aya) => AyaModel.fromJson(aya)).toList();
      return listAyas;
    } catch (e) {
      throw (Exception('failed to fetch surah ${e.toString()}'));
    }
  }

  Future<List<Surah>> fetchSuras() async {
    try {
      Map<String, dynamic> jsonData = await loadAndDecodeFile();

      List<dynamic> listSuar = jsonData['data']['surahs'];
      List<Surah> suar = listSuar.map((e) => Surah.fromJson(e)).toList();
      return suar;
    } catch (e) {
      throw (Exception('failed to fetch suars ${e.toString()}'));
    }
  }
}
