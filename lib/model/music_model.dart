class SongModel {
  final String title;
  final String artist;
  // Diğer gerekli özellikler

  SongModel({
    required this.title,
    required this.artist,
    // Diğer özellikler burada eklenebilir
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      title: json['title'] ?? '',
      artist: json['artist'] ?? '',
      // JSON'dan diğer özellikleri alma işlemleri burada yapılabilir
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'artist': artist,
      // Diğer özellikler burada JSON'a dönüştürülür
    };
  }
}
