import 'package:flutter/material.dart';
import 'package:music_app/consts/textStyle.dart';
import 'package:music_app/pages/artist_song_page.dart';
import 'package:music_app/state_management/get_music_provider.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ArtistListWidget extends StatelessWidget {
   ArtistListWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<GetMusicProvider>(builder:(context, provider, child) {
      
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: provider.artistList.length,
        itemBuilder: (BuildContext context, int index) {
          
       return Stack(
         children:[
           GestureDetector(
            onTap: () {
              
              List<SongModel> artistList = [];
             for (var i = 0; i < provider.artistList.length; i++) {
             
                if(provider.musicList[i].artistId == provider.artistList[index].id){
                    artistList.add(provider.musicList[i]);
                    
                }
              }
              
              Navigator.of(context).push(MaterialPageRoute(builder:(context) => ArtistSongPage(
                listArtist: artistList,
              )));
            },
             child: Container(        
               margin: EdgeInsets.all(15.sp),
               padding: EdgeInsets.all(2.sp),
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: TextStyles.myGradient)
                   ,    
                   child:  QueryArtworkWidget(id: provider.artistList[index].id, type: ArtworkType.ARTIST,
                    quality: 100,
                    artworkFit: BoxFit.cover,
                    artworkHeight: 10.h,
                    artworkWidth: 20.w,
                    artworkQuality: FilterQuality.high,
                    artworkBorder: BorderRadius.circular(60.sp),
                    ),
                   ),
           ),

                 Positioned(
                  bottom: 0.sp
                 // left: 8.sp
                  ,child: Padding(
                    padding:  EdgeInsets.all(15.sp),
                    child:  Text(provider.artistList[index].artist.toString().length > 10 ? "${ provider.artistList[index].artist.toString().substring(0,10) }" : provider.artistList[index].artist.toString())),
                  )
       ]);
     });
    },);
  }
}