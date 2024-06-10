import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/controller/music_play_controller.dart';
import 'package:music_app/controller/playerState.dart';
import 'package:music_app/controller/progess_bar_controlller.dart';
import 'package:music_app/state_management/get_music_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SliderAndIconWidget extends StatefulWidget {
  
   SliderAndIconWidget({super.key});
   
  @override
  State<SliderAndIconWidget> createState() => _SliderAndIconWidgetState();
  
}

class _SliderAndIconWidgetState extends State<SliderAndIconWidget> {
   
  late LoopMode newLoopMode;
    void _onPress() {
     
    
           Provider.of<MusicPlayerController>(context,listen: false).playOrPause(
            Provider.of<PlayerStateles>(context,listen: false).currentIndex
            , (Provider.of<GetMusicProvider>(context,listen: false).musicList[
              Provider.of<PlayerStateles>(context,listen: false).currentIndex
            ].uri).toString());
          Provider.of<GetMusicProvider>(context, listen: false).saveSonMusicList();
       }
  
    late ProgressBarController progressBarController;
    
  @override
  void initState()  {
     super.initState();
  
    progressBarController = ProgressBarController(context);
    newLoopMode = Provider.of<MusicPlayerController>(context, listen: false).player.loopMode;
    progressBarController.init();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
         _onPress();
    });
   
  }
  bool is_Color = false;
  bool is_color_shuffle = false;
 

  @override
  Widget build(BuildContext context) {
    
    return Consumer<GetMusicProvider>(
      
      builder: (context, provider, child) { 
       var _musicPlayerController = Provider.of<MusicPlayerController>(context, listen: false);
        return Column(
        children: [
         Padding(
           padding:  EdgeInsets.only(left: 10.sp, right: 5.sp),
          
           child: StreamBuilder<DurationState >(
            stream: progressBarController.durationState,
            builder: (context, snapshot) {
                final durationState = snapshot.data;
                final progress = durationState?.progress ?? Duration.zero;
                final buffered = durationState?.buffered ?? Duration.zero;
                final total = durationState?.total ?? Duration.zero;
                
                return ProgressBar(
                  progress: progress,
                  buffered: buffered,
                  total: total,
                  
                  onSeek: Provider.of<MusicPlayerController>(context, listen: false).player.seek,
                 
                  barHeight: 2.0,
                );
             },
           )
           
         ),
         SizedBox(height: 3.h,),
         Row(
          mainAxisAlignment: MainAxisAlignment.center
          ,
          children: [
         StreamBuilder<LoopMode>(
          stream: Provider.of<MusicPlayerController>(context, listen: false).player.loopModeStream,
          builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          LoopMode loopMode = snapshot.data ?? LoopMode.off;
            return IconButton(
              
              onPressed: (){
                 Provider.of<MusicPlayerController>(context, listen: false).icon(Provider.of<PlayerStateles>(context,listen: false).currentIndex);
                               Provider.of<PlayerStateles>(context, listen: false).updateCurrentIndex( Provider.of<PlayerStateles>(context,listen: false).currentIndex);

              loopMode == LoopMode.off ? 
               loopMode = LoopMode.all : 
               loopMode = LoopMode.off;
                Provider.of<MusicPlayerController>(context ,listen: false ).player.setLoopMode(loopMode);
               
            }, 
           
           icon: loopMode == LoopMode.all ? Icon( Icons.cached_sharp, size: 5.h, color:  Colors.cyan ) :
           Icon( Icons.cached_sharp, size: 5.h, color:  Colors.white )
           );
          },
        ),


            IconButton(onPressed: (){
              
              is_Color = false;
              Provider.of<PlayerStateles>(context, listen: false).updateCurrentIndex( Provider.of<PlayerStateles>(context,listen: false).currentIndex);
              Provider.of<PlayerStateles>(context,listen: false).pressBack(Provider.of<PlayerStateles>(context,listen: false).currentIndex, context);
              provider.refreshPage();
            }, 
            icon:Icon( Icons.fast_rewind, size: 5.h,)
            ),
            StreamBuilder<bool>(
          stream: Provider.of<MusicPlayerController>(context, listen: false).player.playingStream,
          builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          
            return IconButton(
              onPressed: (){
               Provider.of<MusicPlayerController>(context, listen: false).sonmusicListeEkle(context);
                _musicPlayerController.icon(  Provider.of<PlayerStateles>(context,listen: false).currentIndex);
                
              if(snapshot.data == true){
                Provider.of<MusicPlayerController>(context, listen: false).player.stop();
              }
              else{
                Provider.of<MusicPlayerController>(context, listen: false).player.play();
              }
            }, 
           
           icon: snapshot.data == true? Icon(Icons.pause_circle, size: 8.h,)  : Icon(Icons.play_circle_outline_outlined, size: 8.h,)
          
           );
          },
        ),
            IconButton(onPressed: ()async{
              Provider.of<MusicPlayerController>(context, listen: false).sonmusicListeEkle(context);
               Provider.of<MusicPlayerController>(context, listen: false).player.setLoopMode(LoopMode.off);
               is_Color = false;
             // Provider.of<PlayerStateles>(context, listen: false).updateCurrentIndex( Provider.of<PlayerStateles>(context,listen: false).currentIndex);
              await Provider.of<PlayerStateles>(context,listen: false).onPressNext(Provider.of<PlayerStateles>(context,listen: false).currentIndex, context);
              provider.refreshPage();
            },        
            icon:Icon( Icons.fast_forward, size: 6.h,) 
            ),
      StreamBuilder<bool>(
          stream: Provider.of<MusicPlayerController>(context, listen: false).player.shuffleModeEnabledStream,
         builder: (context, snapshot) {
        if (snapshot.hasError) {
           return Text('Error: ${snapshot.error}');
         }
       final shuffleModeEnabled = snapshot.data ?? false;
      return IconButton(
         icon: shuffleModeEnabled
          ? Icon(Icons.shuffle, color: Colors.orange, size: 5.h)
          : Icon(Icons.shuffle, color: Colors.white, size: 5.h),
      onPressed: () async {
          final musicPlayerController = Provider.of<MusicPlayerController>(context, listen: false); 
          log(Provider.of<PlayerStateles>(context,listen: false).currentIndex.toString());
          if (shuffleModeEnabled == false) {
              await musicPlayerController.player.setShuffleModeEnabled(true);
           }
        else {
          await musicPlayerController.player.setShuffleModeEnabled(false);
        }
      },
    );
  },
),

  
          ],
         )
        ],
       );
       } 
       );
    
  }
}



