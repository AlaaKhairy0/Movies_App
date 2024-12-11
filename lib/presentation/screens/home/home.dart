import 'package:flutter/material.dart';
import 'package:movies_app/core/assets_manager.dart';
import 'package:movies_app/core/strings_manager.dart';
import 'package:movies_app/presentation/screens/home/taps/browse/browse.dart';
import 'package:movies_app/presentation/screens/home/taps/home.dart';
import 'package:movies_app/presentation/screens/home/taps/search.dart';
import 'package:movies_app/presentation/screens/home/taps/watchList/watchList.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchListTab(),
  ];

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
