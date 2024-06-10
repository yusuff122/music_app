
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/consts/textStyle.dart';
import 'package:music_app/widgets/artist_list_widget.dart';
import 'package:sizer/sizer.dart';
import '../widgets/favorites_widget.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});
  @override
  State<LikePage> createState() => _LikePageState();
}
class _LikePageState extends State<LikePage> {
  final controller = PageController( keepPage: true);
  @override
  Widget build(BuildContext context) {
     return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [    
          SizedBox(height: 5.h,),
          Padding(
            padding:  EdgeInsets.only(left: 15.sp),
            child: Text("Sanatçılar", style: TextStyles.textTumSarkilarStyle(context),),
          ),
        Container(
         
          height: 23.h,
           child:ArtistListWidget(),
        ),
          
          SizedBox(height: 1.h,),
          Center(child: Text('favorites', style: TextStyles.favoritesTextStyle(context),)), 

          Container(child: FavoritesWidget(), height: 57.h,)
        ],
   
    );
  }
}