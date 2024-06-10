import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:music_app/controller/music_play_controller.dart';
import 'package:music_app/controller/playerState.dart';
import 'package:music_app/state_management/get_music_provider.dart';
import 'package:provider/provider.dart';

Future<void> getFilePath(String filePath, BuildContext context, int index) async {
   
  try {
    if (await File(filePath).exists()) {
            log('index1 '+Provider.of<GetMusicProvider>(context, listen: false).musicList.length.toString());
      index =  Provider.of<PlayerStateles>(context, listen: false).currentIndex;
     Provider.of<GetMusicProvider>(context, listen: false).sonMusicList.removeWhere((music) => music.id == Provider.of<GetMusicProvider>(context, listen: false).musicList[index].id);

      log(filePath);
      await File(filePath).delete();
      await Provider.of<GetMusicProvider>(context, listen: false).fetchMusic();
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
    log(error.toString());
  }
}
void snackBarMessage( BuildContext context){
    final snackBar = SnackBar(content: Text("Müzik silindi"),duration: Duration(seconds: 3),action: SnackBarAction(label: 'Tamam', onPressed: (){}),);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pop(context);
}