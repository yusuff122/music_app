import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:music_app/controller/music_play_controller.dart';
import 'package:music_app/controller/playerState.dart';
import 'package:music_app/state_management/get_music_provider.dart';
import 'package:music_app/state_management/theme.dart';
import 'package:music_app/state_management/theme_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'pages/my_home_page.dart';


Future<void> main() async {
  
   await JustAudioBackground.init(
      androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
      androidNotificationChannelName: 'Audio playback',
       androidNotificationOngoing: true,
     );
  
  WidgetsFlutterBinding.ensureInitialized(); 
 
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
      

  final music = GetMusicProvider();
  final playerStateles = PlayerStateles();
  

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
         ChangeNotifierProvider(create: (context) => MusicPlayerController(music, playerStateles)),
                ChangeNotifierProvider<GetMusicProvider>.value(value: music), 
                   ChangeNotifierProvider(create: (context) => PlayerStateles()),
    ],child: MyApp(),
    ) 
  );
  //await music.fetchMusic(); 
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
       themeMode:themeProvider.themeMode,
       theme: MyThemes.lightTheme, 
       darkTheme: MyThemes.darkTheme,
       home:  Home(),
      );
    });
});
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    
      checkPermission(Permission.storage, context);
  
  }

 Future<void> checkPermission(Permission permission, BuildContext context) async {
  Map<Permission, PermissionStatus> statuses = await [
  Permission.manageExternalStorage,
  Permission.storage,
  Permission.audio
].request();

log(statuses[Permission.storage].toString());
  
  if (await Permission.storage.request().isGranted || await Permission.audio.request().isGranted || await Permission.manageExternalStorage.request().isDenied) {
        await Provider.of<GetMusicProvider>(context, listen: false).fetchMusic();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
  } else {
    exit(0);
     /* return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text('izin yöneticisi'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Uygulamayı kullabilmek için lütfen gerekli izinleri verin'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('izin ver'),
            onPressed: () {
              openAppSettings();
            },
          ),
        ],
      );
    },
  ); */


  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        title: Text("Home"),
      ),
      
      body: Center(
        child: Text("izinler denetleniyor...")
      ),
    );
  }
}