import 'package:flutter/material.dart';
import 'package:music_app/controller/music_play_controller.dart';
import 'package:music_app/pages/player_page.dart';
import 'package:music_app/state_management/get_music_provider.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../consts/textStyle.dart';
import 'package:music_app/controller/playerState.dart';


class MusicCardWidget extends StatefulWidget {
  String image = '';
  String musicName = '';
  MusicCardWidget({required this.image, required this.musicName});
  @override
  State<MusicCardWidget> createState() => _MusicCardWidgetState();
}

class _MusicCardWidgetState extends State<MusicCardWidget> {
   int index_musicList_eleman = -1;
  @override
  Widget build(BuildContext context) {
    return Consumer<GetMusicProvider>(builder: (context, provider, child) {

      
     return ListView.separated(
        reverse: provider.sonMusicList.isEmpty ? false :true,
        scrollDirection: Axis.horizontal,
        itemCount: provider.sonMusicList.isEmpty
            ? provider.musicList.length <= 2
                ? provider.musicList.length
                : 3
            : provider.sonMusicList.length,
        shrinkWrap: true,
        primary: false,
        separatorBuilder: (context, index) => SizedBox(width: 25.sp,),
        itemBuilder: (context, index) {
          List liste = provider.sonMusicList.isEmpty
              ? provider.musicList
              : provider.sonMusicList;
          return 
                GestureDetector(
                  onTap:() {
                    int i = Provider.of<GetMusicProvider>(context,listen: false).musicList.indexWhere((element) => element.id == liste[index].id);
                      Provider.of<MusicPlayerController>(context,listen:false).sonmusicListeEkle(context);
                      Provider.of<PlayerStateles>(context,listen:false).updateCurrentIndex(i);
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlayerPage() ));
                  },
                  child: Container(
                    height: 15.h,
                    width: 35.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp)
                          ),
                          width: double.infinity,
                          height: 17.h,
                          child: QueryArtworkWidget(
                            artworkQuality: FilterQuality.high,
                            id: liste[index].id,
                            type: ArtworkType.AUDIO,
                            quality: 100,
                            artworkBorder: BorderRadius.circular(5.sp),
                            nullArtworkWidget: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return TextStyles.myGradient.createShader(bounds);
                              },
                              child: Icon(
                                Icons.music_note,
                                size: 120.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          liste[index].displayNameWOExt.toString(),    
                        ),
                       
                          
                      ],
                    ),
                  ),
                );
              
                
                
              
          
        },
      );
    });
  }

  
  
}
