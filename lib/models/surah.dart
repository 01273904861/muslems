class Surah {
  final int number;
  final int numberOfAyahs;
  final String arabicName;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;



  Surah(
      {required this.number,
      required this.numberOfAyahs,
      required this.arabicName,
      required this.englishName,
      required this.englishNameTranslation,
      required this.revelationType});

  factory Surah.fromJson(Map<String, dynamic> jsonData) {
    return Surah(
        number: jsonData['number'],
        numberOfAyahs: jsonData['ayahs'].length,
        arabicName: jsonData['name'],
        englishName: jsonData['englishName'],
        englishNameTranslation: jsonData['englishNameTranslation'],
        revelationType: jsonData['revelationType']);
  }
}
