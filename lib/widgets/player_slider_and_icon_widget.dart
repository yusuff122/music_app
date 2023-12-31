import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:sizer/sizer.dart';

class SliderAndIconWidget extends StatefulWidget {
  const SliderAndIconWidget({super.key});

  @override
  State<SliderAndIconWidget> createState() => _SliderAndIconWidgetState();
}

class _SliderAndIconWidgetState extends State<SliderAndIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Padding(
         padding:  EdgeInsets.only(left: 10.sp, right: 5.sp),
         child: ProgressBar(progress: Duration(microseconds: 1000), 
         total: Duration(minutes: 5),
         buffered: Duration(milliseconds: 2000),
         barHeight: 2,
         baseBarColor: Colors.white,
         onSeek: (value) {
           print(value.toString());
         },
         ),
       ),
       SizedBox(height: 3.h,),
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){}, 
          icon:Icon( Icons.cached_sharp, size: 5.h,)
          ),
          IconButton(onPressed: (){}, 
          icon:Icon( Icons.fast_rewind, size: 6.h,)
          ),
           Padding(
             padding:  EdgeInsets.only(right: 15.sp),
             child: IconButton(onPressed: (){}, 
              icon:Icon( Icons.pause_circle, size: 10.h,)
              ),
           ),
          
          IconButton(onPressed: (){}, 
          icon:Icon( Icons.fast_forward, size: 6.h,)
          ),
          IconButton(onPressed: (){}, 
          icon:Icon( Icons.shuffle, size: 5.h,)
          )
        ],
       )
      ],
    );
  }
}