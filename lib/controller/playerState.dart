import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:music_app/controller/music_play_controller.dart';
import 'package:music_app/state_management/get_music_provider.dart';
import 'package:provider/provider.dart';

class PlayerStateles  extends ChangeNotifier  {
  static int _curentIndex = 0;
     
  int get currentIndex => _curentIndex;

  updateCurrentIndex(int newIndex) {
    _curentIndex = newIndex;
    notifyListeners(); 
  }

onPressNext(int index, BuildContext context) {
  if(!Provider.of<MusicPlayerController>(context, listen: false).player.shuffleModeEnabled){
     int nextIndex = index + 1;
    if (nextIndex < Provider.of<GetMusicProvider>(context, listen: false).musicList.length) {
        Provider.of<MusicPlayerController>(context, listen: false).playOrPause(nextIndex,Provider.of<GetMusicProvider>(context, listen: false).musicList[nextIndex].uri.toString(),);
       Provider.of<PlayerStateles>(context, listen: false).updateCurrentIndex(nextIndex); 
    }
  }
  else{
    log((MusicPlayerController.playingIndex + 1).toString());
    int nextIndex = MusicPlayerController.playingIndex + 1;
    if (nextIndex < Provider.of<GetMusicProvider>(context, listen: false).musicList.length) {
        Provider.of<MusicPlayerController>(context, listen: false).playOrPause(nextIndex,Provider.of<GetMusicProvider>(context, listen: false).musicList[nextIndex].uri.toString(),);
       Provider.of<PlayerStateles>(context, listen: false).updateCurrentIndex(nextIndex); 
    }
  }
   notifyListeners(); 
}

   pressBack(int index, BuildContext context) {
  int nextIndex = index - 1;
  if (nextIndex < Provider.of<GetMusicProvider>(context, listen: false).musicList.length) {
    Provider.of<MusicPlayerController>(context, listen: false).playOrPause(
        nextIndex,
        Provider.of<GetMusicProvider>(context, listen: false).musicList[nextIndex].uri.toString()
        
        );
    Provider.of<PlayerStateles>(context, listen: false).updateCurrentIndex(nextIndex); 
    
  }
  notifyListeners(); 
}
} 