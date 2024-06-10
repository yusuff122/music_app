import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/controller/playerState.dart';
import 'package:music_app/state_management/get_music_provider.dart';
import 'dart:developer';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:provider/provider.dart';

class MusicPlayerController extends ChangeNotifier {

 final player = AudioPlayer();
  int newIndex = -1;
  var numbersSet = <int>{};
  static int  playingIndex = -1;

  final StreamController<bool> _favoriteStatusController = StreamController<bool>.broadcast();
  Stream<bool> get favoriteStatusStream => _favoriteStatusController.stream;

  final GetMusicProvider _musicProvider;
  late PlayerStateles _playerStateles;
  late BuildContext context;
  
  MusicPlayerController(this._musicProvider, this._playerStateles){

    player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
          playOrPause(playingIndex+1, _musicProvider.musicList[playingIndex+1].uri.toString());
      }
    });
   
  }
 


  Future<void> playOrPause(int index, String uri) async {
    
     if (player.shuffleModeEnabled) {
               
      
       
       if (index == playingIndex){

          if (player.playing){
            player.stop();
            icon(index);
            notifyListeners(); 
          } 
          else{
            player.play();
            icon(index);
            notifyListeners(); 
          }
       }
       else{
         final songToPlay = _musicProvider.shuffle_list.firstWhere((song) => song.uri.toString() == uri);

           newIndex = _musicProvider.musicList.indexOf(songToPlay);

           playingIndex = index;
          log(_musicProvider.shuffle_list[index].displayNameWOExt);
           
          _playerStateles.updateCurrentIndex(index);
          
          uri = _musicProvider.shuffle_list[index].uri.toString();
          log('index '+newIndex.toString());
          
          await player.setAudioSource( 
            AudioSource.uri(
              Uri.parse(uri),
               tag: MediaItem(
                   id: _musicProvider.shuffle_list[index].id.toString(),
                   title: _musicProvider.shuffle_list[index].displayNameWOExt,
                   album: _musicProvider.shuffle_list[index].album,
                   artUri: Uri.parse('images/konser.jpeg')     
            ),
            ),);
          player.play();
          icon(index);
          
          _musicProvider.refreshPage();
          notifyListeners(); 
       }
       
     }
    else{
    if (index == playingIndex) {
      
      if (player.playing){
         player.stop();
         icon(index);
         notifyListeners();
      }
      else{ 
        player.play();
        icon(index);
        notifyListeners();
      }
       
    } else {
       try {
         log(_musicProvider.musicList[index].id.toString());
          log(_musicProvider.musicList[index].title);

        await player.setAudioSource(AudioSource.uri(
        Uri.parse(uri),
        tag: MediaItem(
                   id: _musicProvider.musicList[index].id.toString(),
                   title: _musicProvider.musicList[index].displayNameWOExt,
                   album: _musicProvider.musicList[index].album,
                   artUri: Uri.parse('images/konser.jpeg')     

            ),
        ));
       player.play();
      playingIndex = index;
      _playerStateles.updateCurrentIndex(index);
      icon(index);
      _musicProvider.refreshPage();
       } catch (e) {
         log("e "+e.toString());
       }
    }
      notifyListeners(); 
    }
  
  }

  Icon icon(int index) { 
    if (index == playingIndex) { 
       return player.playing ?  Icon(Icons.pause_circle) : Icon(Icons.play_circle_outline_outlined) ;
    } else {
       return Icon(Icons.play_circle_outline_outlined);
    }
   
  }

  void uykuZamanlayici(String dk, int index){
    Future.delayed( Duration(minutes: int.parse(dk)),(){
     player.stop();
     icon(-1);
    });
  }

   void sonmusicListeEkle (BuildContext context)async{ 
    
      final currentMusicId = Provider.of<GetMusicProvider>(context, listen: false)
        .musicList[Provider.of<PlayerStateles>(context, listen: false).currentIndex]
        .id;
      
     final containsId = Provider.of<GetMusicProvider>(context, listen: false)
        .sonMusicList
        .any((music) => music.id == currentMusicId);

        if (containsId) {
         
         log("müzik bulunuyor");          
        }
        else{
             Provider.of<GetMusicProvider>(context,listen: false).sonMusicList.add(
             Provider.of<GetMusicProvider>(context,listen: false).musicList[
             Provider.of<PlayerStateles>(context,listen: false).currentIndex
          ]);
        }
       }
     
  
    Future<bool> begenilenMusicekle(BuildContext context) async {
    bool begenilmeDurumu = false;
    final getMusicProvider = Provider.of<GetMusicProvider>(context, listen: false);
    final currentMusicId = getMusicProvider.musicList[
      Provider.of<PlayerStateles>(context, listen: false).currentIndex
    ].id;

    final containsId = getMusicProvider.favoritesMusicListe.any((music) => music.id == currentMusicId);
    
    if (containsId) {
      log('id '+containsId.toString());
      log('durum true '+begenilmeDurumu.toString());
      begenilmeDurumu == false;
      getMusicProvider.favoritesMusicListe.removeWhere((music) => music.id == currentMusicId);
    } else {
      Provider.of<GetMusicProvider>(context,listen: false).favoritesMusicListe.add(
             Provider.of<GetMusicProvider>(context,listen: false).musicList[
             Provider.of<PlayerStateles>(context,listen: false).currentIndex
          ]);
      begenilmeDurumu == false ? begenilmeDurumu = true : begenilmeDurumu = false;
    }
     log('durum true '+begenilmeDurumu.toString());
    log(getMusicProvider.favoritesMusicListe.toString());
    _favoriteStatusController.add(begenilmeDurumu);
    getMusicProvider.saveFavoritesMusicListe();
    notifyListeners();  
    _musicProvider.refreshPage();
    return begenilmeDurumu;
  }

  
  
  Future<void> getFilePath(File file, BuildContext context, int index) async {
   
  try {
    if (await file.exists()) {
            log('index1 '+Provider.of<GetMusicProvider>(context, listen: false).musicList.length.toString());
      index =  Provider.of<PlayerStateles>(context, listen: false).currentIndex;
      Provider.of<GetMusicProvider>(context, listen: false).sonMusicList.removeWhere((music) => music.id == Provider.of<GetMusicProvider>(context, listen: false).musicList[index].id);
          
      await file.delete();
      await Provider.of<GetMusicProvider>(context, listen: false).saveSonMusicList();

      Provider.of<GetMusicProvider>(context, listen: false).musicList.removeAt(index);
     Provider.of<GetMusicProvider>(context, listen: false).loadSonMusicList();
      log('index2 '+Provider.of<GetMusicProvider>(context, listen: false).musicList.length.toString());
      await Provider.of<PlayerStateles>(context, listen: false)
          .updateCurrentIndex(index + 1);
      Provider.of<MusicPlayerController>(context, listen: false).playOrPause(
        index + 1,
        Provider.of<GetMusicProvider>(context, listen: false)
            .musicList[index + 1]
            .uri
            .toString()
      );
         
      snackBarMessage(context);
    } else {
   
    }
  } catch (error) {
    log('error '+error.toString());
  }
}
void snackBarMessage( BuildContext context){
    final snackBar = SnackBar(content: Text("Müzik silindi"),duration: Duration(seconds: 3),action: SnackBarAction(label: 'Tamam', onPressed: (){}),);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pop(context);
}
}