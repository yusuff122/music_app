import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetMusicProvider extends ChangeNotifier {
  late OnAudioQuery _audioQuery;
  static List<SongModel> _musicList = [];
  List<SongModel> _sonMusicListe = [];
  static List<ArtistModel> _artistList = [];
  List<SongModel> artist_music = [];
   List<SongModel> _shuffle_list = [];
  List<SongModel> _favoritesMusicListe = [];

  List<SongModel> get shuffle_list => _shuffle_list;
  List<SongModel> get favoritesMusicListe => _favoritesMusicListe;
  List<SongModel> get sonMusicList => _sonMusicListe;
  List<ArtistModel> get artistList => _artistList;
  List<SongModel> get musicList => _musicList;

  static const String _sonMusicListKey = 'sonMusicList'; 
  static const String _favoritesMusicListeKey = 'favoritesMusicListe'; 
  GetMusicProvider() {
    loadSonMusicList();
    loadFavoritesMusicListe();
   
  }
    

Future<void> loadFavoritesMusicListe() async {
 final SharedPreferences prefs = await SharedPreferences.getInstance();
 final List<dynamic>? favoritesMusicListeJson = prefs.getStringList(_favoritesMusicListeKey);

if (favoritesMusicListeJson != null && favoritesMusicListeJson.isNotEmpty) {
 

  for (var jsonStr in favoritesMusicListeJson) { 
  var list = List.from(json.decode(jsonStr)); 
   
   for(int i = 0; i < list.length; i++){
       final Map<dynamic, dynamic> jsonMap = list[i] as Map;
     final SongModel song = SongModel(jsonMap); 
     _favoritesMusicListe.add(song);
   }
}
 

notifyListeners();
} else {
  _favoritesMusicListe = [];
  notifyListeners();
}
}

Future<void> saveFavoritesMusicListe() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  
  final List<Map<String, dynamic>> favoritesMusicListeJson = _favoritesMusicListe.map((song) => {
  '_id': song.id,
  '_data': song.data,
  '_uri': song.uri,
  '_display_name': song.displayName,
  '_display_name_wo_ext': song.displayNameWOExt,
  '_size': song.size,
  'album': song.album,
  'album_id': song.albumId,
  'artist': song.artist,
  'artist_id': song.artistId,
  'genre': song.genre,
  'genre_id': song.genreId,
  'bookmark': song.bookmark,
  'composer': song.composer,
  'dateAdded': song.dateAdded,
  'date_modified': song.dateModified,
  'duration': song.duration,
  'title': song.title,
  'track': song.track,
  'file_extension': song.fileExtension,
  'is_alarm': song.isAlarm,
  'is_audiobook': song.isAudioBook,
  'is_music': song.isMusic,
  'is_notification': song.isNotification,
  'is_podcast': song.isPodcast,
  'is_ringtone': song.isRingtone,
    
  }).toList();
  final String encodedData = jsonEncode(favoritesMusicListeJson);
   
  await prefs.setStringList(_favoritesMusicListeKey, [encodedData]);
  notifyListeners();
}



Future<void> loadSonMusicList() async {
 final SharedPreferences prefs = await SharedPreferences.getInstance();
 final List<dynamic>? sonMusicListJson = prefs.getStringList(_sonMusicListKey);

if (sonMusicListJson != null && sonMusicListJson.isNotEmpty) {
 

  for (var jsonStr in sonMusicListJson) { 
  var list = List.from(json.decode(jsonStr)); 
   
   for(int i = 0; i < list.length; i++){
       final Map<dynamic, dynamic> jsonMap = list[i] as Map;
     final SongModel song = SongModel(jsonMap); 
     _sonMusicListe.add(song);
   }
}
notifyListeners();
} else {
  _sonMusicListe = [];
  notifyListeners();
}
}

Future<void> saveSonMusicList() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  
  final List<Map<String, dynamic>> sonMusicListJson = _sonMusicListe.map((song) => {
  '_id': song.id,
  '_data': song.data,
  '_uri': song.uri,
  '_display_name': song.displayName,
  '_display_name_wo_ext': song.displayNameWOExt,
  '_size': song.size,
  'album': song.album,
  'album_id': song.albumId,
  'artist': song.artist,
  'artist_id': song.artistId,
  'genre': song.genre,
  'genre_id': song.genreId,
  'bookmark': song.bookmark,
  'composer': song.composer,
  'dateAdded': song.dateAdded,
  'date_modified': song.dateModified,
  'duration': song.duration,
  'title': song.title,
  'track': song.track,
  'file_extension': song.fileExtension,
  'is_alarm': song.isAlarm,
  'is_audiobook': song.isAudioBook,
  'is_music': song.isMusic,
  'is_notification': song.isNotification,
  'is_podcast': song.isPodcast,
  'is_ringtone': song.isRingtone,
    
  }).toList();
  final String encodedData = jsonEncode(sonMusicListJson);
  log(encodedData);
  await prefs.setStringList(_sonMusicListKey, [encodedData]);
  notifyListeners();
}

  Future<void> fetchMusic() async {
    _audioQuery = OnAudioQuery();
    _musicList = await _audioQuery.querySongs(
      sortType: SongSortType.DATE_ADDED,
      orderType: OrderType.DESC_OR_GREATER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );
   log('son musicList '+sonMusicList.length.toString());
    _artistList = await _audioQuery.queryArtists();
    _shuffle_list = _musicList.toList()..shuffle();
    notifyListeners();
  }
  
  
  void refreshPage() {
    notifyListeners();
  }
}
