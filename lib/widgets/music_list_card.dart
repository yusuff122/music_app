import 'package:flutter/material.dart';
import 'package:music_app/consts/textStyle.dart';
import 'package:music_app/controller/music_play_controller.dart';
import 'package:music_app/controller/playerState.dart';
import 'package:music_app/pages/player_page.dart';
import 'package:music_app/state_management/get_music_provider.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';


class MusicListCardWidget extends StatefulWidget {
   
   MusicListCardWidget();

  @override
  State<MusicListCardWidget> createState() => _MusicListCardWidgetState();
  
}

class _MusicListCardWidgetState extends State<MusicListCardWidget> {
  List<SongModel> musicList = [];
 
  
  
  late OnAudioQuery _audioQuery;
 


  @override
  void initState() {
    super.initState();
    
    _audioQuery = OnAudioQuery();
  }
 
 @override
  void dispose() {
    super.dispose();
  }

   

 @override
Widget build(BuildContext context) {
  
  return  Consumer<GetMusicProvider>(
      builder: (context, provider, child) {
       
        if (provider.musicList.isNotEmpty) {
          return SizedBox(
            width: double.infinity,
            child: ListView.builder(
              itemCount: provider.musicList.length,
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.only(left: 0.w),
              itemBuilder: (context, index) {
                  
                return GestureDetector(
                  onTap: () {
                    
                    Provider.of<PlayerStateles>(context,listen:false).updateCurrentIndex(index);
                    Provider.of<MusicPlayerController>(context,listen:false).sonmusicListeEkle(context);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlayerPage() ));
                  },
                  child: ListTile(
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
                    leading: QueryArtworkWidget(
                      artworkBorder: BorderRadius.circular(5.sp),
                             id:   provider.musicList[index].id,
                            type:     ArtworkType.AUDIO,
                                 quality: 100,
                    ),
                  
                    trailing:Consumer<MusicPlayerController>(
                      builder: (context, controller, child) {
                        IconData iconData = controller.icon(index).icon as IconData;
                       return Icon(iconData);
                  
                      },
                    ) 
                  ),
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
