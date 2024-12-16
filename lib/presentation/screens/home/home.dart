import 'package:flutter/material.dart';
import 'package:movies_app/core/assets_manager.dart';
import 'package:movies_app/core/strings_manager.dart';
import 'package:movies_app/presentation/screens/home/taps/browse/browse_view/browse_view.dart';
import 'package:movies_app/presentation/screens/home/taps/home/home_view/home_view.dart';
import 'package:movies_app/presentation/screens/home/taps/search/search.dart';
import 'package:movies_app/presentation/screens/home/taps/watchList/watchList_view/watchList_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final GlobalKey<WatchListViewState> watchListKey = GlobalKey();
  List<Widget> tabs = [];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs=[
      HomeView(),
      SearchTab(),
      BrowseView(),
      WatchListView(key: watchListKey,),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: buildBottomNavBar(),
    );
  }
  Widget buildBottomNavBar() {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
          if (value == 3) {
            // Call getMovieFromFireStore when Watch List tab is selected
            watchListKey.currentState?.getMoviesFromFireStore();}
        },

        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AssetsManager.home),
              ),
              label: StringsManager.homeLabel),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AssetsManager.search),
              ),
              label: StringsManager.search),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AssetsManager.browse),
              ),
              label: StringsManager.browse),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AssetsManager.watchList),
              ),
              label: StringsManager.watchList)
        ]);
  }
}
