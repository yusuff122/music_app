
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextStyles{


  static TextStyle appBarTextStyle(BuildContext context){
     return TextStyle(
      fontSize: 30,fontFamily: 'elYazisi',fontWeight: FontWeight.bold,
      color: Theme.of(context).primaryColor
      );
  }
  static TextStyle plyListTextStyle(BuildContext context){
     return TextStyle(
      fontSize: 12,fontFamily: 'elYazisi',fontWeight: FontWeight.normal,
      color: Theme.of(context).primaryColor
      );
  }
  static TextStyle musicListCardTextStyle(BuildContext context){
    return TextStyle(
      fontSize: 12,  fontFamily: 'musikCardYazi', color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle marqueTextStyle(BuildContext context){
    return TextStyle(
       fontWeight: FontWeight.bold, fontFamily:'musikCardYazi', color: Theme.of(context).primaryColor );
  }
  static TextStyle favoritesTextStyle(BuildContext context){
    return TextStyle(
      fontFamily: 'elYazisi', fontSize: 22, color: Theme.of(context).primaryColor,
    );
  }
  static TextStyle playerMusicNameTextStyle(BuildContext context){
    return TextStyle(fontFamily: 'musikCardYazi', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);

  }
   static TextStyle playerArtistNameTextStyle(BuildContext context){
    return TextStyle(fontFamily: 'musikCardYazi', color: Colors.white70, fontSize: 14,fontWeight: FontWeight.bold);
    
  }
  static TextStyle textTumSarkilarStyle(BuildContext context){
    return TextStyle( fontWeight: FontWeight.bold, fontSize: 15.sp);
    
  }
  static Color colorMethod(int sayi){
    if(sayi %2==0){
      return Colors.red.shade300;
    }
    else{
      return Colors.deepPurple;
    }
  }
  static Gradient myGradient = LinearGradient(
    colors: [Color(0xff780206), Color(0xff061161)], 
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter, 
  );

  static LinearGradient colorsLinaer(BuildContext context){

    if (ThemeData == ThemeData.dark()){
       return LinearGradient(colors: [
           Colors.black,
           Colors.transparent
        ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
                            //stops: [0.sp,0.5.sp]
        );
    }
    else{
      return  LinearGradient(colors: [
        Colors.black,
           Colors.transparent
           
        ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
                            //stops: [0.sp,0.5.sp]
        );
    }
  


     }

      static Color artistCardColor(BuildContext context){
       return Theme.of(context).primaryColor;
    }
     static TextStyle artistCardTextStyle(BuildContext context){
    return TextStyle(
      fontSize: 12,  fontFamily: 'musikCardYazi',
      fontWeight: FontWeight.bold,
     // color: Theme.of(context).splashColor
    );
  }
}