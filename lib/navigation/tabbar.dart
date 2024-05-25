import 'package:flutter/material.dart';
import 'package:prime_movie_app/screens/download.dart';
import 'package:prime_movie_app/screens/home_screen.dart';
import 'package:prime_movie_app/screens/livetv.dart';
import 'package:prime_movie_app/screens/searchscreen.dart';
import 'package:prime_movie_app/screens/store.dart';
import 'package:prime_movie_app/utils/apptheme.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedTab,
            onTap: (index) {
              setState(() {
                this._selectedTab = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_filled,
                    color: apptheme.bottomNavBarIconsColor,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: apptheme.bottomNavBarIconsColor,
                  ),
                  label: "Store"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.live_tv_outlined,
                    color: apptheme.bottomNavBarIconsColor,
                  ),
                  label: "Live TV"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.download_sharp,
                    color: apptheme.bottomNavBarIconsColor,
                  ),
                  label: "Downloads"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: apptheme.bottomNavBarIconsColor,
                  ),
                  label: "Search"),
            ]),
        body: Stack(
          children: [
            renderView(0, HomeScreen()),
            renderView(1, StoreScreen()),
            renderView(2, LiveTV()),
            renderView(3, DownloadScreen()),
            renderView(4, SearchScreen())
          ],
        ),
      ),
    );
  }

  Widget renderView(int tabindex, Widget view) {
    return IgnorePointer(
      ignoring: _selectedTab != tabindex,
      child: Opacity(
        opacity: _selectedTab == tabindex ? 1 : 0,
        child: view,
      ),
    );
  }
}
