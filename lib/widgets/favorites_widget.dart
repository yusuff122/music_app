import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:music_app/pages/player_page.dart';
import 'package:music_app/state_management/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
class FavoritesWidget extends StatefulWidget {
  const FavoritesWidget({super.key});

  @override
  State<FavoritesWidget> createState() => _FavoritesWidgetState();
}

class _FavoritesWidgetState extends State<FavoritesWidget> {
  final heights = [
  120,
  130,
  140,
  150,
  160,
  170,
];
final colors = [
  Colors.red,
  Colors.redAccent,
  Colors.deepOrange,
  Colors.orange,
  Colors.amberAccent,
  Colors.yellow,
  Colors.lightGreenAccent,
  Colors.lightGreen,
  Colors.green,
  Colors.greenAccent,
  Colors.lightBlueAccent,
  Colors.blue,
];
final images = [
  'images/altay.jpg',
  'images/azer.jpg',
  'images/ceza.jpg',
  'images/gazapizm.jpg',
  'images/muslum.jpg',
  'images/polatAlemdar.jpg',
  'images/sagopa.jpg'
];



  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.all(5.sp),
      child: DynamicHeightGridView(

       itemCount: 15, 
       crossAxisCount: 2,
       builder: (ctx, index ){
        colors.shuffle();
        heights.shuffle();
        images.shuffle();
         return Container(
          height: heights.first.toDouble(),
          decoration: BoxDecoration(
           // color: colors.first,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            children: [
              Expanded(child: ClipRRect(
                borderRadius: BorderRadius.circular(10)
                ,child: GestureDetector(
                  onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlayerPage(  
                      imagePath: images.first,
                      )));                    
                  },
                  child: Image.asset(
                    images.first,fit: BoxFit.cover,
                  ),
                ))),
                Text(images.first.replaceAll(RegExp(r'images/'), ''))
            ],
            
          ),
         );
       }
       ),
    );
  }
}