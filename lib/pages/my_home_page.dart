import 'package:flutter/material.dart';
import 'package:music_app/pages/search_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'home_page.dart';
import 'like_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage( {super.key});
 
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   final _pageController = PageController();
  int _currentIndex = 0;
  final List<Widget> altSayfalar = [HomePage(), LikePage(), SearchPage()];

  @override
  void initState() {
    super.initState();
      WidgetsBinding.instance.addPostFrameCallback((_) {
    });
  }
 



  @override
  void dispose() {
   _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    /* appBar: AppBar(
        elevation: 0,
       // title: Text('Discover', style: TextStyles.appBarTextStyle(context)),
        actions: [ThemeButtonWidget()],
      ),*/
      body: PageView(
        controller: _pageController,
        children: altSayfalar,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      extendBody: true,
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage( 
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.bounceOut,
          );
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Likes"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}