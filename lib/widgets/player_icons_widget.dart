import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:music_app/controller/music_play_controller.dart';
import 'package:music_app/controller/playerState.dart';
import 'package:music_app/state_management/get_music_provider.dart';
import 'package:music_app/state_management/theme_provider.dart';
import 'package:music_app/widgets/bottom_sheet_widget.dart';
import 'package:music_app/widgets/file_share.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PlayerIconsWidget extends StatefulWidget {
  final int index;

   PlayerIconsWidget({ required this.index, super.key});
  @override
  State<PlayerIconsWidget> createState() => _PlayerIconsWidgetState();
}
class _PlayerIconsWidgetState extends State<PlayerIconsWidget> {
  late File file ;
  @override
  Widget build(BuildContext context) {
    
    return Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.keyboard_arrow_down_sharp,
        color: Colors.white,
        size: 7.h,
        weight: 5,
      ),
    ),
    PopupMenuButton<String>(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'Uyku zamanlayıcı',
            child: TextButton(
              child: Text("Uyku zamanlayıcı"),
              onPressed: (){
                  bottomSheet(context, widget.index);
              },
            )
          ),
         
          PopupMenuItem<String>(
            value: 'Arka plan değiştir',
            child: TextButton(child: Text('Arka plan değiştir'), onPressed: ()async{
              final picker = ImagePicker();
             final pickedFile = await picker.pickImage(source: ImageSource.gallery);
             if(pickedFile!= null){
              Provider.of<ThemeProvider>(context, listen: false).setAssetImage(pickedFile.path);
             }
            },),
          ),
          PopupMenuItem<String>(  
            value: 'Sil',
            child: TextButton(child: Text('Sil'), 
            onPressed: (){
             if(Provider.of<MusicPlayerController>(context, listen: false).player.shuffleModeEnabled){
                file = File(Provider.of<GetMusicProvider>(context,listen: false).shuffle_list[Provider.of<PlayerStateles>(context,listen: false).currentIndex].data);
              Provider.of<MusicPlayerController>(context, listen: false).getFilePath(  file, context,Provider.of<PlayerStateles>(context,listen: false).currentIndex );
             }else{
                file = File(Provider.of<GetMusicProvider>(context,listen: false).musicList[Provider.of<PlayerStateles>(context,listen: false).currentIndex].data);
                log(file.toString());
                Provider.of<MusicPlayerController>(context, listen: false).getFilePath(  file, context,Provider.of<PlayerStateles>(context,listen: false).currentIndex );
             }       
            },),
          ),
          PopupMenuItem<String>(
            value: 'Paylaş',
            child: TextButton(child: Text('Paylaş'),
            onPressed: () {
             if(Provider.of<MusicPlayerController>(context, listen: false).player.shuffleModeEnabled){
              file_share(context,
              Provider.of<GetMusicProvider>(context,listen: false).shuffle_list[
                Provider.of<PlayerStateles>(context,listen: false).currentIndex
              ].data
              );
             }else{
                 file_share(context,
              Provider.of<GetMusicProvider>(context,listen: false).musicList[
                Provider.of<PlayerStateles>(context,listen: false).currentIndex
              ].data
              );
             }      
            }),
          ),
        ];
      },
      onSelected: (value) {
        switch (value) {
          case 'Uyku zamanlayıcı':
            break;
          case 'Arka plan değiştir':       
            break;
          case 'Paylaş':
             print('paylaş');
            break;
          case 'Sil':
            break;
        }
      },
    ),
  ],
);

  }
  
}