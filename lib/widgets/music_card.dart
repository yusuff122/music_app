import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:music_app/consts/textStyle.dart';
import 'package:music_app/state_management/get_music_provider.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:marquee/marquee.dart';

class MusicCardWidget extends StatefulWidget {
   String image = '';
   String musicName = '';
   MusicCardWidget({required  this.image, required this.musicName});
  @override
  State<MusicCardWidget> createState() => _MusicCardWidgetState();
}
class _MusicCardWidgetState extends State<MusicCardWidget> {
  
  @override
  Widget build(BuildContext context) {
    if(Provider.of<GetMusicProvider>(context).sonMusicList.length >= 3){
      return   Consumer<GetMusicProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemCount: provider.sonMusicList.length,
          shrinkWrap: true,
          primary: false,
          itemExtent: 60.w, 

  itemBuilder: (context, index) {
    
    return Container(
      child: Stack(
        children: [
          Container(
            width: 50.w,
            height: 30.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: QueryArtworkWidget(
              id: provider.sonMusicList[index].id,
              type: ArtworkType.AUDIO,
              quality: 100,

              
            ),
          ),
          Positioned(
            top: 130.sp,
            left: 117.sp,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pink.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: Icon(Icons.play_circle_outline_outlined, size: 30.sp),
                onPressed: () {},
              ),
            ),
          ),
          Positioned(
            bottom: 10.sp,
            left: 0.sp,
            
            child: Container(
              height: 5.h,
              width: 39.w,
              decoration: BoxDecoration(color: Theme.of(context).cardColor,
               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
              child: Marquee(
                text: provider.sonMusicList[index].displayNameWOExt,
                scrollAxis: Axis.horizontal,
                style: TextStyles.marqueTextStyle(context),
                decelerationCurve: Curves.easeOut,
                startPadding: 10.0.sp,
                blankSpace: 25.0.sp,
              ),
            ),
          ),
        ],
      ),
    );
  },
);

    });
    


    }
    else{
      return   Consumer<GetMusicProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          shrinkWrap: true,
          primary: false,
          itemExtent: 60.w, 

  itemBuilder: (context, index) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: 50.w,
            height: 30.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: QueryArtworkWidget(
              id: provider.musicList[index].id,
              type: ArtworkType.AUDIO,
              quality: 100,
              nullArtworkWidget: ShaderMask(
        shaderCallback: (Rect bounds) {
          return TextStyles.myGradient.createShader(bounds);
        },
        child: Icon(Icons.music_note, size: 120.sp,), 
            ),
          ),
          ),
          Positioned(
            top: 150.sp,
            left: 117.sp,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pink.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.play_circle_outline_outlined, size: 25.sp),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10.sp,
            left: 0.sp,
            
            child: Container(
              height: 5.h,
              width: 39.w,
              decoration: BoxDecoration(color: Theme.of(context).cardColor,
               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
              child: Marquee(
                text:  provider.musicList[index].displayNameWOExt,
                scrollAxis: Axis.horizontal,
                style: TextStyles.marqueTextStyle(context),
                decelerationCurve: Curves.easeOut,
                startPadding: 10.0.sp,
                blankSpace: 25.0.sp,
              ),
            ),
          ),
        ],
      ),
    );
  },
);

    });
    }

  }
}


/*
  Consumer<GetMusicProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          
          scrollDirection: Axis.horizontal,
          itemCount: provider.sonMusicListe.length,
          shrinkWrap: true,
          primary: false,
          itemExtent: 60.w, 

  itemBuilder: (context, index) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: 50.w,
            height: 30.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: QueryArtworkWidget(
              id: provider.sonMusicListe[index].id,
              type: ArtworkType.AUDIO,
            ),
          ),
          Positioned(
            top: 130.sp,
            left: 117.sp,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pink.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: Icon(Icons.play_circle_outline_outlined, size: 30.sp),
                onPressed: () {},
              ),
            ),
          ),
          Positioned(
            bottom: 10.sp,
            left: 0.sp,
            
            child: Container(
              height: 5.h,
              width: 39.w,
              decoration: BoxDecoration(color: Theme.of(context).cardColor,
               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
              child: Marquee(
                text: provider.sonMusicListe[index].displayNameWOExt,
                scrollAxis: Axis.horizontal,
                style: TextStyles.marqueTextStyle(context),
                decelerationCurve: Curves.easeOut,
                startPadding: 10.0.sp,
                blankSpace: 25.0.sp,
              ),
            ),
          ),
        ],
      ),
    );
  },
);

    });
*/