import 'package:flutter/material.dart';
import 'package:music_app/consts/textStyle.dart';
import 'package:music_app/controller/music_play_controller.dart';
import 'package:music_app/controller/playerState.dart';
import 'package:music_app/pages/player_page.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';


class ArtistSongPage extends StatefulWidget {
  List<SongModel> listArtist = [];
   ArtistSongPage({super.key, required this.listArtist});

  @override
  State<ArtistSongPage> createState() => _ArtistSongPageState();
}

class _ArtistSongPageState extends State<ArtistSongPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     
      appBar: AppBar(
       
        actions: [
       // IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios))
      ],),
      body: Container(
        decoration: BoxDecoration(
  ),
        child: ListView.builder(
          itemCount: widget.listArtist.length
          ,itemBuilder:(context, index) {
            int minutes = (widget.listArtist[index].duration! ~/ 1000)~/ 60;
             int seconds = widget.listArtist[index].duration! % 60;
          return GestureDetector(

           onTap: () {
             Provider.of<PlayerStateles>(context,listen:false).updateCurrentIndex(index);
                    Provider.of<MusicPlayerController>(context,listen:false).sonmusicListeEkle(context);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlayerPage() ));
           },

            child: Card(
            //  color: TextStyles.artistCardColor(context),
              child: ListTile(
                leading: QueryArtworkWidget(id: widget.listArtist[index].id, type: ArtworkType.AUDIO, artworkBorder: BorderRadius.circular(10.sp),),
                title: Text(widget.listArtist[index].displayNameWOExt.toString(), maxLines: 1, overflow: TextOverflow.ellipsis,style:  TextStyles.artistCardTextStyle(context),),
                subtitle: Text(widget.listArtist[index].artist.toString(), maxLines: 1, overflow: TextOverflow.ellipsis ,style:  TextStyles.artistCardTextStyle(context),),
                trailing: Text('$minutes:$seconds ', style: TextStyle(fontSize: 11.sp),),
              ),
            ),
          );
        },),
      ),
    );
    
  }


  _sureAyarla(int duration ){
    
    
    int minutes = (duration ~/ 1000)~/ 60;
    int seconds = duration % 60;
    return '$minutes  $seconds ';
  }
}