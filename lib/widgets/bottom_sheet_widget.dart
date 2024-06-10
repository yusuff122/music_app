import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:music_app/controller/music_play_controller.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

PersistentBottomSheetController? _bottomSheetController;

Future<void> bottomSheet(BuildContext context, index_music) async {
   _bottomSheetController = await showFlexibleBottomSheet(
     minHeight: 0,
      initHeight: 0.5,
      maxHeight: 0.8,
      isExpand: true,
 
      bottomSheetColor: Colors.white30,
    context: context,
    bottomSheetBorderRadius:  BorderRadius.circular(20.sp),
    builder: (BuildContext context, ScrollController scrollController, double bottomSheetOffset) {
      return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
           return listViewMethod(context, (5*(index+1)).toString(), index_music);
      },);
    },
  );
}

Widget listViewMethod(BuildContext context, String dk , index ){
  return  Card(
    color: Colors.black,
    child: ListTile(
                enabled: true,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(dk, style: TextStyle(color: Colors.white),),
                    SizedBox(width: 1.h),
                    Text("Dakika")
                  ],
                ),
                onTap: () {
                  
                  snackBarMessage(dk, context,index);
                },
          ),
  );
}

void snackBarMessage(String dk, BuildContext context,index){
    final snackBar = SnackBar(content: Text("Uyku zamanlayıcısı ${dk} dakikaya ayarlandı"),duration: Duration(seconds: 3),action: SnackBarAction(label: 'Tamam', onPressed: (){}),);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pop(context);
          Provider.of<MusicPlayerController>(context, listen: false).uykuZamanlayici(dk, index);

}