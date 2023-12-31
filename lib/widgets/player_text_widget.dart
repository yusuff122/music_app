import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:music_app/consts/textStyle.dart';
import 'package:sizer/sizer.dart';

class PlayerTextWidget extends StatefulWidget {
  const PlayerTextWidget({super.key});

  @override
  State<PlayerTextWidget> createState() => _PlayerTextWidgetState();
}

class _PlayerTextWidgetState extends State<PlayerTextWidget> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(left: 25.sp),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Acem Kızı ',style: TextStyles.playerMusicNameTextStyle(context),),
              Padding(
                padding:  EdgeInsets.only(right: 25.sp),
                child: Icon(Icons.favorite_border, size: 30,),
              )
            ],
          ),
          SizedBox(height: 1.h,),
          Text('Polat Alemdar', style: TextStyles.playerArtistNameTextStyle(context),)
        ],
      ),
    );
  }
}