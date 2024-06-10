import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:music_app/consts/textStyle.dart';
import 'package:music_app/controller/music_play_controller.dart';
import 'package:music_app/controller/playerState.dart';
import 'package:music_app/state_management/get_music_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';


class PlayerTextWidget extends StatefulWidget {



   
  @override
  State<PlayerTextWidget> createState() => _PlayerTextWidgetState();
}

class _PlayerTextWidgetState extends State<PlayerTextWidget> {

   
  bool begenilme_durumu = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<GetMusicProvider>(
            builder: (context, musicProvider, child) {
              final currentIndex = Provider.of<PlayerStateles>(context, listen: false).currentIndex;
           
              final currentMusic = Provider.of<MusicPlayerController>(context, listen: false).player.shuffleModeEnabled? 
              musicProvider.shuffle_list[currentIndex]
              :musicProvider.musicList[currentIndex];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 30.h,
                    child: Text(
                      currentMusic.displayNameWOExt,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.playerMusicNameTextStyle(context),
                    ),
                  ),
                  Padding( //Provider.of<MusicPlayerController>(context, listen: false).begenilenMusicekle(context) 
                    padding: EdgeInsets.only(right: 25.sp),
                    child: StreamBuilder<bool>(
                          stream: Provider.of<MusicPlayerController>(context, listen: false).favoriteStatusStream,
                          
                          builder: (context, snapshot) {
                            bool begenilmeDurumu = snapshot.data ?? false;

                          return IconButton(
                             onPressed: () async {
                             await Provider.of<MusicPlayerController>(context, listen: false).begenilenMusicekle(context);
                             await musicProvider.saveFavoritesMusicListe();
                            },
                            icon:  musicProvider.favoritesMusicListe.any((music) => music.id == musicProvider.musicList[currentIndex].id)
                              ? Icon(Icons.favorite_sharp, size: 35, color: Colors.pink)
                               : Icon(Icons.favorite_border, size: 35),
                              );
                              },
                             ),

                  )
                ],
              );
            },
          ),
          SizedBox(height: 1.h,),
          Consumer<GetMusicProvider>(
            builder: (context, musicProvider, child) {
              final currentIndex = Provider.of<PlayerStateles>(context, listen: false).currentIndex;
              
              final currentMusic = Provider.of<MusicPlayerController>(context, listen: false).player.shuffleModeEnabled?
               musicProvider.shuffle_list[currentIndex]
               :musicProvider.musicList[currentIndex];
              return Text(
                currentMusic.artist.toString(),
                style: TextStyles.playerArtistNameTextStyle(context),
                overflow: TextOverflow.ellipsis,
              );
            },
          ),
        ],
      ),
    );
  }
}
