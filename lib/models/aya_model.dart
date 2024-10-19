class AyaModel {
  final String text;
  final dynamic sajda;
  final int number;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;

  // Main constructor
  AyaModel._(this.text, this.sajda, this.number, this.numberInSurah, this.juz,
      this.manzil, this.page, this.ruku, this.hizbQuarter);

  // Named constructor for processing the text
  factory AyaModel(String text, dynamic sajda, int number, int numberInSurah,
      int juz, int manzil, int page, int ruku, int hizbQuarter) {
    if (text.contains('بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ')) {
      text = text.substring(0, 38) + '\n' + text.substring(38);
    }
    return AyaModel._(text, sajda, number, numberInSurah, juz, manzil, page,
        ruku, hizbQuarter);
  }

  // Factory constructor for JSON deserialization
  factory AyaModel.fromJson(Map<String, dynamic> jsonData) {
    return AyaModel(
        jsonData['text'],
        jsonData['sajda'],
        jsonData['number'],
        jsonData['numberInSurah'],
        jsonData['juz'],
        jsonData['manzil'],
        jsonData['page'],
        jsonData['ruku'],
        jsonData['hizbQuarter']);
  }
}
