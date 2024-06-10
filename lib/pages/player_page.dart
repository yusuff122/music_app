import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:music_app/controller/music_play_controller.dart';
import 'package:music_app/controller/playerState.dart';
import 'package:music_app/state_management/get_music_provider.dart';
import 'package:music_app/widgets/player_icons_widget.dart';
import 'package:music_app/widgets/player_slider_and_icon_widget.dart';
import 'package:music_app/widgets/player_text_widget.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';


class PlayerPage extends StatefulWidget {
  PlayerPage({Key? key}) : super(key: key);
  @override
  State<PlayerPage> createState() => _PlayerPageState();
}


class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GetMusicProvider>(
        builder: (context, provider, child) {
          return Stack( 
            fit: StackFit.expand,
            children: [
              QueryArtworkWidget(
                id: Provider.of<MusicPlayerController>(context, listen: false).player.shuffleModeEnabled ?
                  provider.shuffle_list[Provider.of<PlayerStateles>(context, listen: false).currentIndex ].id
                : provider.musicList[Provider.of<PlayerStateles>(context, listen: false).currentIndex ].id,
                type: ArtworkType.AUDIO,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0.sp, sigmaY: 10.0.sp),
                child: Card(
                  elevation: 0,
                  color: Colors.white.withOpacity(0.1),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2.h,),
                        PlayerIconsWidget(index: Provider.of<PlayerStateles>(context, listen: false).currentIndex,),
                        SizedBox(height: 5.h,),
                        Center(
                          child: SizedBox(
                            height: 40.h,
                            width: 80.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: QueryArtworkWidget(
                               id: Provider.of<MusicPlayerController>(context, listen: false).player.shuffleModeEnabled ?
                  provider.shuffle_list[Provider.of<PlayerStateles>(context, listen: false).currentIndex ].id
                : provider.musicList[Provider.of<PlayerStateles>(context, listen: false).currentIndex ].id,
                type: ArtworkType.AUDIO,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 3.h,),
                        PlayerTextWidget(),
                        SizedBox(height: 10.h,),
                        SliderAndIconWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
