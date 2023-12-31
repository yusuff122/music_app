
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:music_app/state_management/theme_provider.dart';
import 'package:music_app/widgets/player_icons_widget.dart';
import 'package:music_app/widgets/player_slider_and_icon_widget.dart';
import 'package:music_app/widgets/player_text_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PlayerPage extends StatefulWidget {
  String imagePath = '';
   PlayerPage({super.key, required this.imagePath});
  @override
  State<PlayerPage> createState() => _PlayerPageState(); 
}
class _PlayerPageState extends State<PlayerPage> {
   
   @override
  void initState() {
    Provider.of<ThemeProvider>(context, listen: false).setAssetImage(widget.imagePath);
    super.initState();
  }
   
  @override
  Widget build(BuildContext context) {
     print('Asset Image Path: ${Provider.of<ThemeProvider>(context).assetImage}');
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Provider.of<ThemeProvider>(context).assetImage,
            ),
          fit: BoxFit.cover
        ),
         ),
         child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Card(
            elevation: 10,
            color: Colors.white.withOpacity(0.1),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.h,),
                  PlayerIconsWidget(),
                  SizedBox(height: 5.h,),
                  Center(
                    child: SizedBox(
                      height: 40.h,
                      width: 80.w,
                      child: ClipRRect( 
                       borderRadius: BorderRadius.circular(10),
                       child:  imageType(),
                        /*Image.file(
                          File(Provider.of<ThemeProvider>(context).assetImage),
                          fit: BoxFit.cover,
                        ),*/
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h,),
                  PlayerTextWidget(),
                  SizedBox(height: 10.h,),
                  SliderAndIconWidget(),
                ],
              ),
            ),
          ),
         ), 
         
         )
    );
    
  }
  
  Widget imageType() {
    if(Provider.of<ThemeProvider>(context).assetImage.startsWith('assets/')){
       return Image.asset(
       Provider.of<ThemeProvider>(context).assetImage,
      fit: BoxFit.cover,
    );
    }
    else {
  // Gelen dosya bir dosya yolu
   return Image.file(
      File(Provider.of<ThemeProvider>(context).assetImage),
      fit: BoxFit.cover,
    );
  }
  }



}