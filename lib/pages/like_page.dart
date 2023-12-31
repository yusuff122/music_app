import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:music_app/consts/textStyle.dart';
import 'package:sizer/sizer.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import '../widgets/favorites_widget.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});
  @override
  State<LikePage> createState() => _LikePageState();
}
class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Column(
        children: [    
          Center(child: Text('favorites', style: TextStyles.favoritesTextStyle(context),)), 
          Expanded(child: FavoritesWidget())
        ],
      ),
    );
  }
}