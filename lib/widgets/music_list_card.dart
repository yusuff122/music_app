import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:music_app/consts/textStyle.dart';
import 'package:music_app/state_management/get_music_provider.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';

class MusicListCardWidget extends StatefulWidget {
   
   MusicListCardWidget();

  @override
  State<MusicListCardWidget> createState() => _MusicListCardWidgetState();
  
}

class _MusicListCardWidgetState extends State<MusicListCardWidget> {
  List<SongModel> musicList = [];
  bool isPlay = false;
  late AudioPlayer _audioPlayer;
  late OnAudioQuery _audioQuery;
  final mmr = MetadataRetriever();
  int _playingIndex = -1;

  @override
  void initState() {
    _audioPlayer = AudioPlayer();
    _audioQuery = OnAudioQuery();
    super.initState();
    
  }
 
 @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  
  _isplayer(audioPath, index)async{
    if(isPlay){
      try {
      await _audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(audioPath)));
      await _audioPlayer.stop();
      isPlay = false;
      
    } catch (e) {
      print("Error playing music: $e");
    }
    }
    else{
      try {
      await _audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(audioPath)));
      await _audioPlayer.play();
      isPlay = true;
    } catch (e) {
      print("Error playing music: $e");
    }
    }
    setState(() {
      int _playingIndex = index;
    });
  }

 @override
Widget build(BuildContext context) {
  
  return  Consumer<GetMusicProvider>(
      builder: (context, provider, child) {
        print('main ${provider.musicList.length}');
        if (provider.musicList.isNotEmpty) {
          return SizedBox(
            width: double.infinity,
            child: ListView.builder(
              itemCount: provider.musicList.length,
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.only(left: 6.w),
              itemBuilder: (context, index) {
               
                return ListTile(
                  title: Text(
                   provider.musicList[index].displayNameWOExt,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyles.musicListCardTextStyle(context),
                  ),
                  subtitle: Text(
                    provider.musicList[index].artist != '<unknown>'
                        ? provider.musicList[index].artist.toString()
                        : provider.musicList[index].displayName.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 11),
                  ),
                  leading:FutureBuilder<Uint8List?>(
                    future: _audioQuery.queryArtwork(
                      
                    provider.musicList[index].id,
                    ArtworkType.AUDIO,
                    quality: 50,
                    
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data != null) {
                  
                return CircleAvatar(
                  backgroundImage: MemoryImage(snapshot.data!),
                );
              } else {
                return CircleAvatar(
                  child: Icon(Icons.music_note),
                );
              }
            },
          ),
                  // QueryArtworkWidget(id:provider.musicList[index].id, type: ArtworkType.AUDIO),
                  trailing:
                      IconButton(
                        icon:
                        index ==_playingIndex ? Icon(Icons.pause_circle) : Icon(Icons.play_circle_outline_outlined, size: 30),
                        onPressed: () {
                          if(provider.sonMusicList.contains(provider.musicList[index]) == false){
                              provider.sonMusicList.add(provider.musicList[index]);
                             if(provider.sonMusicList.length > 10){
                                 provider.sonMusicList.removeAt(0);
                            }
                          }   
                          _isplayer(provider.musicList[index].uri, index);
                        },
                      )   
                      
                      // Text('04.52'),
                   
                );
              },
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
   
  );
}


 


}
