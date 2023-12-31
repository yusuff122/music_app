import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:on_audio_query/on_audio_query.dart';

class GetMusicProvider extends ChangeNotifier{
 
  late OnAudioQuery _audioQuery;
  List<SongModel> _musicList = [];
  List<SongModel> _sonMusicListe = [];
  MetadataRetriever retriever = MetadataRetriever();

 List<SongModel> get sonMusicList => _sonMusicListe;
 void addMusic(SongModel song){
    print('listenin öğrencisi ${_sonMusicListe.length}');
    
     _sonMusicListe.add(song);
     notifyListeners();
 }

  List<SongModel> get musicList => _musicList;
  
  Future<void> fetchMusic() async {
    print("çalıştı");
    
     _audioQuery = OnAudioQuery();
      ByteData _byteData;
    
    _musicList = await _audioQuery.querySongs(
      sortType: SongSortType.DATE_ADDED,
      orderType: OrderType.DESC_OR_GREATER,
      uriType: UriType.EXTERNAL,  
      ignoreCase: true,
    );
    notifyListeners();
 
  }
   


}

