
import 'package:flutter/material.dart';
import 'package:music_app/consts/textStyle.dart';

import 'package:music_app/widgets/music_list_card.dart';
import 'package:music_app/widgets/theme_button.dart';
import 'package:sizer/sizer.dart';
import '../widgets/music_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  
  

  @override
  Widget build(BuildContext context) {
   
     final controller = PageController( keepPage: true);
       return   ListView(

                children: [
                    
                  Stack(
                    children:[ 
                      Positioned(
                        child: Container(
                          width: double.infinity,
                          height: 33.h,
                          alignment: Alignment.topCenter,
                          
                          foregroundDecoration: BoxDecoration(
                            gradient: TextStyles.colorsLinaer(context),
                          ),
                          child: Image.asset('images/konser2.jpg',fit: BoxFit.fitHeight,),
                                            ),
                      ),
                      Positioned(
                        child: Text('F.L.A.M.E.',style: TextStyle(fontSize: 25.sp,color: Colors.white ,fontWeight: FontWeight.bold),),
                        bottom: 45.sp,
                        left: 10.sp,
                        ),
                        Positioned(
                          bottom: 20.sp,
                          left: 10.sp,
                          child: Container(
                            height: 1.h,
                            width: 10.h,
                            decoration: BoxDecoration(
                              
                              borderRadius: BorderRadius.circular(20.sp)
                            ),
                            child: ThemeButtonWidget(),
                          )
                          
                          )
                    ]
                  ),
 

                   SizedBox(height: 2.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 15.sp),
                        child: Text("En son", style: TextStyles.plyListTextStyle(context)),
                      ),
                      SizedBox(width: 2.w,),
                      Icon(Icons.auto_awesome_motion_rounded, size: 2.h,)
                    ],
                  ),
                  SizedBox(height: 1.h,), 
                 
                  Padding(
                    padding:  EdgeInsets.only(left: 10.sp, right: 10.sp),
                    child: Container(
                      
                   //   color: Colors.pink,
                      height: 25.h,
                      width: double.maxFinite,
                      child: PageView(        
                        controller: controller,
                         
                        children: [
                          MusicCardWidget( image: 'images/gazapizm.jpg',musicName: 'gazapizm'),  
                        ],
                      )
                      ),
                  ),
                  SizedBox(height: 2.h,),
                  Padding(
                    padding:  EdgeInsets.only(left: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Tüm şarkılar", style:TextStyles.textTumSarkilarStyle(context) ,),
                        Icon(Icons.music_note_outlined)
                      ],
                    ),
                  ),
                  SizedBox(height: 1.h,),
                  Padding(
                    padding: EdgeInsets.only(right: 0.sp, left: 0),
                    child: MusicListCardWidget(),
                  ),
                    
                ],
             
        );
      
    
  }
}