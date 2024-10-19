class HadithModel {
  final String? nameArabic;
  final String? nameEnglish;
  final String hadithArabic;
  final String hadithEnglish;

  HadithModel({
    required this.nameEnglish,
    required this.nameArabic,
    required this.hadithArabic,
    required this.hadithEnglish,
  });
  factory HadithModel.fromJson(Map<String, dynamic> jsonData) {
    return HadithModel(
      nameArabic: jsonData['headingArabic'] ?? '',
     nameEnglish: jsonData['headingEnglish']?? '',
      hadithArabic: jsonData['hadithArabic'],
      hadithEnglish: jsonData['hadithEnglish'],
      
    );
  }
}
