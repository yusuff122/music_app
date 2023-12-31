import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:music_app/consts/textStyle.dart';
import 'package:music_app/pages/player_page.dart';
import 'package:music_app/state_management/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:path_provider/path_provider.dart';
class PlayerIconsWidget extends StatefulWidget {
   PlayerIconsWidget({ super.key});
  @override
  State<PlayerIconsWidget> createState() => _PlayerIconsWidgetState();
}
class _PlayerIconsWidgetState extends State<PlayerIconsWidget> {

  @override
  Widget build(BuildContext context) {
    
   // final PlayerPage playerPage;
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
            child: Text('Uyku zamanlayıcı'),
          ),
          PopupMenuItem<String>(
            value: 'Zil Sesi düzenleyici',
            child: Text('Zil Sesi düzenleyici'),
          ),
          PopupMenuItem<String>(
            value: 'Arka plan değiştir',
            child: TextButton(child: Text('Arka plan değiştir'), onPressed: ()async{
              final picker = ImagePicker();
             final pickedFile = await picker.pickImage(source: ImageSource.gallery);
             if(pickedFile!= null){
            // setState(() {
              Provider.of<ThemeProvider>(context, listen: false).setAssetImage(pickedFile.path);
          //    });
             }
            },),
          ),
          PopupMenuItem<String>(  
            value: 'Paylaş',
            child: Text('Paylaş'),
          ),
          PopupMenuItem<String>(
            value: 'Sil',
            child: Text('Sil'),
          ),
        ];
      },
      onSelected: (value) {
        
        switch (value) {
          case 'Uyku zamanlayıcı':
            break;
          case 'Zil Sesi düzenleyici':
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