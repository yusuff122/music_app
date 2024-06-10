

class SongModels {
  final Map<dynamic, dynamic> _info;

  SongModels(this._info);

  factory SongModels.fromJson(Map<String, dynamic> json) {
    return SongModels({
      '_id': json['_id'],
      '_data': json['_data'],
      '_uri': json['_uri'],
      '_display_name': json['_display_name'],
      '_display_name_wo_ext': json['_display_name_wo_ext'],
      '_size': json['_size'],
      'album': json['album'],
      'album_id': json['album_id'],
      'artist': json['artist'],
      'artist_id': json['artist_id'],
      'genre': json['genre'],
      'genre_id': json['genre_id'],
      'bookmark': json['bookmark'],
      'composer': json['composer'],
      'date_added': json['date_added'],
      'date_modified': json['date_modified'],
      'duration': json['duration'],
      'title': json['title'],
      'track': json['track'],
      'file_extension': json['file_extension'],
      'is_alarm': json['is_alarm'],
      'is_audiobook': json['is_audiobook'],
      'is_music': json['is_music'],
      'is_notification': json['is_notification'],
      'is_podcast': json['is_podcast'],
      'is_ringtone': json['is_ringtone'],
    });
  }

  int get id => _info['_id'];
  String get data => _info['_data'];
  String? get uri => _info['_uri'];
  String get displayName => _info['_display_name'];
  String get displayNameWOExt => _info['_display_name_wo_ext'];
  int get size => _info['_size'];
  String? get album => _info['album'];
  int? get albumId => _info['album_id'];
  String? get artist => _info['artist'];
  int? get artistId => _info['artist_id'];
  String? get genre => _info['genre'];
  int? get genreId => _info['genre_id'];
  int? get bookmark => _info['bookmark'];
  String? get composer => _info['composer'];
  int? get dateAdded => _info['date_added'];
  int? get dateModified => _info['date_modified'];
  int? get duration => _info['duration'];
  String get title => _info['title'];
  int? get track => _info['track'];
  String get fileExtension => _info['file_extension'];
  bool? get isAlarm => _info['is_alarm'];
  bool? get isAudioBook => _info['is_audiobook'];
  bool? get isMusic => _info['is_music'];
  bool? get isNotification => _info['is_notification'];
  bool? get isPodcast => _info['is_podcast'];
  bool? get isRingtone => _info['is_ringtone'];

  Map get getMap => _info;
  
 



  @override
  String toString() {
    return _info.toString();
  }
}
