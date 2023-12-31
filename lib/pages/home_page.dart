import 'package:flutter/material.dart';
import 'package:music_app/consts/textStyle.dart';
import 'package:music_app/state_management/get_music_provider.dart';
import 'package:music_app/state_management/theme_provider.dart';
import 'package:music_app/widgets/music_list_card.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:path_provider/path_provider.dart';
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
       return Scaffold( 
          body:  ListView(
                children: [
                   SizedBox(height: 2.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("En son", style: TextStyles.plyListTextStyle(context)),
                      SizedBox(width: 2.w,),
                      Icon(Icons.auto_awesome_motion_rounded)
                    ],
                  ),
                  SizedBox(height: 2.h,), 
                 
                  Padding(
                    padding:  EdgeInsets.only(left: 10.sp),
                    child: SizedBox(
                      
                      height: 33.h,
                      width: double.maxFinite,
                      child: PageView(    
                        
                        controller: controller,
                        
                         
                        children: [
                          MusicCardWidget( image: 'images/gazapizm.jpg',musicName: 'gazapizm'),  
                        
                        ],
                      )
                      ),
                  ),
                    //SizedBox(height: 5.h,),
                  MusicListCardWidget(),
                    
                ],
              ),
        );
      
    
  }
}