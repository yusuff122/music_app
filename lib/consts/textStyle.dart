
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles{

  //TextStyles._();   \
   

  static TextStyle appBarTextStyle(BuildContext context){
     return TextStyle(
      fontSize: 30,fontFamily: 'elYazisi',fontWeight: FontWeight.bold,
      color: Theme.of(context).primaryColor
      );
  }
  static TextStyle plyListTextStyle(BuildContext context){
     return TextStyle(
      fontSize: 16,fontFamily: 'elYazisi',fontWeight: FontWeight.normal,
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
    return TextStyle(fontFamily: 'musikCardYazi', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 21);

  }
   static TextStyle playerArtistNameTextStyle(BuildContext context){
    return TextStyle(fontFamily: 'musikCardYazi', color: Colors.white70, fontSize: 13);
    
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
            colors: [Colors.blue, Colors.red], 
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter, 
          );
   
}