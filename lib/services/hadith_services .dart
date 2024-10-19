import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:muslems_app/models/hadith_model.dart';

class HadithServices {
  Dio dio;
  HadithServices({required this.dio});
  Future<List<HadithModel>> fetchHadith(String bookName) async {
    try {
      final Response res = await dio.get(
          'https://hadithapi.com/public/api/hadiths?apiKey=\$2y\$10\$8nUR4bbvIaZBOgSz3lj32t1wyMsYiIPq98E2b5HpAR6inpZ0SmC&$bookName');
      Map<String, dynamic> jsonData = res.data;
      List<dynamic> dataList = jsonData['hadiths']['data'];
      List<HadithModel> hadithList = [];
      for (var element in dataList) {
        hadithList.add(HadithModel.fromJson(element));
      }

      return hadithList;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('failed to load hadith ${e.response!.data['message']}');
      } else {
        throw Exception('failed to load hadith ${e.message}');
      }
    } catch (e) {
      throw Exception('failed to load hadith ${e.toString()}');
    }
  }

  Future<List<HadithModel>> fetchAhadith() async {
    try {
      final String data = await rootBundle.loadString('assets/ahadith.json');
      Map<String, dynamic> jsonData = jsonDecode(data);
      List<dynamic> dataList = jsonData['hadiths']['data'];
      List<HadithModel> ahadithList =
          dataList.map((hadith) => HadithModel.fromJson(hadith)).toList();
      return ahadithList;
    } on Exception catch (e) {
      throw Exception('thre was an erorr${e.toString()}');
    }
  }
}
