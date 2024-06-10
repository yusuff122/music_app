import 'package:flutter/src/widgets/framework.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/controller/music_play_controller.dart';
import 'package:music_app/controller/playerState.dart';
import 'package:music_app/state_management/get_music_provider.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';



class ProgressBarController {
  
  Stream<DurationState>? durationState;
  late BuildContext context;
 
  ProgressBarController(this.context);

   

  void init() {
    final musicList = Provider.of<GetMusicProvider>(context, listen: false).musicList;
    final currentIndex = Provider.of<PlayerStateles>(context, listen: false).currentIndex;
    final uri = musicList[currentIndex].uri;
    final player = Provider.of<MusicPlayerController>(context, listen: false).player;

    durationState = Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
      player.positionStream,
      player.playbackEventStream,
      (position, playbackEvent) => DurationState(
        progress: position,
        buffered: playbackEvent.bufferedPosition,
        total: playbackEvent.duration,
      ),
    );

    player.setUrl(uri!);
  }


}


class DurationState {
  const DurationState({
    required this.progress,
    required this.buffered,
    this.total,
  });
  final Duration progress;
  final Duration buffered;
  final Duration? total;
}