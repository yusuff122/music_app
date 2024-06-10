import 'package:flutter/material.dart';
import 'package:music_app/consts/textStyle.dart';
import 'package:music_app/state_management/get_music_provider.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
//import 'package:searchbar_animation/searchbar_animation.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

    TextEditingController _searchController = TextEditingController();
    List<SongModel> filteredMusicList = [];

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          SizedBox(height: 5.h,),
           Padding(
             padding:  EdgeInsets.all(12.sp),
             child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
               
               hintText: 'Müzik ara',
               
               
              ),
              onChanged: (value) {
                 filterMusicList(value);
               
              },
             ),
           ),
           SizedBox(height: 10,),
                   Expanded(
                     child: ListView.builder(
                                 itemCount: filteredMusicList.length,
                                 itemBuilder: (context, index) {
                                   return 
                                    ListTile(
              title: Text(filteredMusicList[index].displayNameWOExt, overflow: TextOverflow.ellipsis,
              maxLines: 1,
               style: TextStyles.musicListCardTextStyle(context),),
              subtitle: Text(
                 filteredMusicList[index].artist!= '<unknown>' ?   
                 filteredMusicList[index].artist.toString() :
                 filteredMusicList[index].displayName.toString(),
              maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11),), 
              leading:  QueryArtworkWidget(id: filteredMusicList[index].id, type: ArtworkType.AUDIO),
              trailing: Icon(Icons.arrow_forward_ios_sharp, size: 25.sp, color:TextStyles.colorMethod(index),)              
           );
             },
            ),
          ),
        ], 
     
    );
  }
    List<SongModel> filterMusicList(String query) {
    filteredMusicList =  Provider.of<GetMusicProvider>(context, listen: false).musicList
        .where((music) =>
            music.displayNameWOExt.toLowerCase().contains(query.toLowerCase()))
        .toList();
     setState(() {
       
     });
     return filteredMusicList;
  }
}