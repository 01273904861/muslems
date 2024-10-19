import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/dkr_model.dart';

class AdkarServices {
  Future<Map<String, dynamic>> loadFileAndConvertToMap() async {
    final String jsonString =
        await rootBundle.loadString('assets/azkar.json'); //load file
    Map<String, dynamic> jsonData = json.decode(jsonString); //extract map
    return jsonData;
  }

  Future<List<DkrModel>> fetchAdkarElsapah() async {
    Map<String, dynamic> jsonData = await loadFileAndConvertToMap();
    final List<dynamic> adkarJson = jsonData['أذكار الصباح'];

    // Convert the List<dynamic> into a List<Dkr>
    final List<DkrModel> adkar =
        adkarJson.map((e) => DkrModel.fromJson(e)).toList();
    return adkar;
  }

  Future<List<DkrModel>> fechAdkarElmasaa() async {
    Map<String, dynamic> jsonData = await loadFileAndConvertToMap();
    List<dynamic> listAdkarElmassa = jsonData['أذكار المساء'];
    List<DkrModel> adkar =
        listAdkarElmassa.map((e) => DkrModel.fromJson(e)).toList();
    return adkar;
  }

  Future<List<DkrModel>> fetchWakeUpAdkar() async {
    Map<String, dynamic> jsonData = await loadFileAndConvertToMap();

    List<dynamic> adkar = jsonData['أذكار الاستيقاظ من النوم'];
    List<DkrModel> adkarList = adkar.map((e) => DkrModel.fromJson(e)).toList();
    return adkarList;
  }

  //أذكار الآذان"
  Future<List<DkrModel>> fetchCallingForPray() async {
    Map<String, dynamic> jsonData = await loadFileAndConvertToMap();

    List<dynamic> adkar = jsonData['أذكار الآذان'];
    List<DkrModel> adkarList = adkar.map((e) => DkrModel.fromJson(e)).toList();
    return adkarList;
  }

  Future<List<DkrModel>> fetchWearingClothes() async {
    Map<String, dynamic> jsonData = await loadFileAndConvertToMap();

    List<dynamic> adkar = jsonData['دعاء لبس الثوب'];
    List<DkrModel> adkarList = adkar.map((e) => DkrModel.fromJson(e)).toList();
    return adkarList;
  }

//"دعاء الجلسة بين السجدتين"

  Future<List<DkrModel>> fetchPraying() async {
    Map<String, dynamic> jsonData = await loadFileAndConvertToMap();

    List<dynamic> adkar = jsonData["دعاء الجلسة بين السجدتين"];
    List<DkrModel> adkarList = adkar.map((e) => DkrModel.fromJson(e)).toList();
    return adkarList;
  }

  Future<List<DkrModel>> fetchWearingNewClothes() async {
    Map<String, dynamic> jsonData = await loadFileAndConvertToMap();

    List<dynamic> adkar = jsonData["دعاء لبس الثوب الجديد"];
    List<DkrModel> adkarList = adkar.map((e) => DkrModel.fromJson(e)).toList();
    return adkarList;
  }

//"دعاء الذهاب إلى المسجد"

  Future<List<DkrModel>> fetchGoToMosque() async {
    Map<String, dynamic> jsonData = await loadFileAndConvertToMap();

    List<dynamic> adkar = jsonData["دعاء الذهاب إلى المسجد"];
    List<DkrModel> adkarList = adkar.map((e) => DkrModel.fromJson(e)).toList();
    return adkarList;
  }

//"الدعاء بعد التشهد الأخير قبل السلام"
  Future<List<DkrModel>> fetchBeforFinishPray() async {
    Map<String, dynamic> jsonData = await loadFileAndConvertToMap();

    List<dynamic> adkar = jsonData["الدعاء بعد التشهد الأخير قبل السلام"];
    List<DkrModel> adkarList = adkar.map((e) => DkrModel.fromJson(e)).toList();
    return adkarList;
  }

//"دعاء الهم والحزن"
  Future<List<DkrModel>> fetchPrayForSad() async {
    Map<String, dynamic> jsonData = await loadFileAndConvertToMap();

    List<dynamic> adkar = jsonData['دعاء الهم والحزن'];
    List<DkrModel> adkarList = adkar.map((e) => DkrModel.fromJson(e)).toList();
    return adkarList;
  }

//"أذكار النوم"

  Future<List<DkrModel>> fetchPrayForSleeping() async {
    Map<String, dynamic> jsonData = await loadFileAndConvertToMap();

    List<dynamic> adkar = jsonData["أذكار النوم"];
    List<DkrModel> adkarList = adkar.map((e) => DkrModel.fromJson(e)).toList();
    return adkarList;
  }
}
