import 'package:flutter/material.dart';
import 'package:music_app/state_management/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ThemeButtonWidget extends StatelessWidget {
  const ThemeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      height: 8.h,
      
      child: FittedBox(
        fit: BoxFit.cover,
        child: Switch.adaptive(
          activeColor: Color.fromARGB(255, 3, 43, 205),
          inactiveThumbColor: Color.fromARGB(255, 66, 203, 66),
          inactiveTrackColor: Color.fromARGB(255, 79, 237, 67),
         
          value : themeProvider.isDarkMode, 
          activeThumbImage: AssetImage("images/dark.png",),
          inactiveThumbImage:  AssetImage("images/ligth.png"),
          onChanged: (bool value) { 
            final provider = Provider.of<ThemeProvider>(context, listen: false);
            provider.temaDegis(value);
            print(value);
           },
        ),
      ),
    );
  }
}