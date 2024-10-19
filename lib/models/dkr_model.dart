class DkrModel {
  final String title;
  final String zekr;
  final String description;
  final int count;
  final String reference;

  DkrModel({
    required this.title,
    required this.zekr,
    required this.description,
    required this.count,
    required this.reference,
  });

  factory DkrModel.fromJson(Map<String, dynamic> json) {
    return DkrModel(
      title: json['title'],
      zekr: json['zekr'],
      description: json['description'],
      count: json['count'],
      reference: json['reference'],
    );
  }
}
