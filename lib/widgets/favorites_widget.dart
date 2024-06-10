import 'package:flutter/material.dart';
import 'package:music_app/controller/music_play_controller.dart';
import 'package:music_app/controller/playerState.dart';
import 'package:music_app/pages/player_page.dart';
import 'package:music_app/state_management/get_music_provider.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart'; 
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FavoritesWidget extends StatefulWidget {
  const FavoritesWidget({super.key});

  @override
  State<FavoritesWidget> createState() => _FavoritesWidgetState();
}

class _FavoritesWidgetState extends State<FavoritesWidget> {
  final heights = [
  22.h,
  30.h,
  37.h,
  43.h,
  16.h,
  34.h,
];
final colors = [
  Colors.red,
  Colors.redAccent,
  Colors.deepOrange,
  Colors.orange,
  Colors.amberAccent,
  Colors.yellow,
  Colors.lightGreenAccent,
  Colors.lightGreen,
  Colors.green,
  Colors.greenAccent,
  Colors.lightBlueAccent,
  Colors.blue,
];

  @override
  Widget build(BuildContext context) {
    return  Consumer<GetMusicProvider>(
      builder: (context, provider, child) {
       
      return MasonryGridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 3, 
      itemCount: provider.sonMusicList.length
      ,itemBuilder:(context, index) {
        double ht = ((index%2)+2)*90;

        return Padding(padding: EdgeInsets.all(12.sp),
        child: GestureDetector(
           
           onTap: () {
                 int i = provider.musicList.indexWhere((element) => element.id == provider.sonMusicList[index].id);
                Provider.of<PlayerStateles>(context,listen:false).updateCurrentIndex(i);
                  Provider.of<MusicPlayerController>(context,listen:false).sonmusicListeEkle(context);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlayerPage() )); 
           }
          ,child: Container(
            width: ht,
           // color: Colors.amber,
            child: CircleAvatar(
              
              backgroundColor: Colors.cyan,
              
              child: QueryArtworkWidget(
                id: provider.sonMusicList[index].id, type: ArtworkType.AUDIO,
                artworkFit: BoxFit.cover,
                artworkHeight: 17.h,
                artworkWidth: 31.w,
                artworkBorder: BorderRadius.circular(50.sp),
                
                ) ,
            ),
          ),
        ),
        );
      },);
    }
    );
  }
}