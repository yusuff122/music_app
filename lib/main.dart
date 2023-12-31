import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app/state_management/get_music_provider.dart';
import 'package:music_app/state_management/theme.dart';
import 'package:music_app/state_management/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'pages/my_home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

      final music = GetMusicProvider();
      await music.fetchMusic(); 
      print("main ${music.musicList.length}");

  runApp(
    MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
                ChangeNotifierProvider<GetMusicProvider>.value(value: music),

    ],child: MyApp(),
    )
   
    
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)=> ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    builder: (context, _) {
  
     final themeProvider = Provider.of<ThemeProvider>(context,);
    
     
      return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
         title: 'Flutter Demo',
       debugShowCheckedModeBanner: false,
       //theme: Provider.of<ThemeProvider>(context).themeData,
       themeMode:themeProvider.themeMode,
       theme: MyThemes.lightTheme, 
       darkTheme: MyThemes.darkTheme,
       home: const MyHomePage(),
      );
    });
});


}