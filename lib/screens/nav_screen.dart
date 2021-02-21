import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responseuiapp/models/repository_provider.dart';
import 'package:flutter_responseuiapp/screens/coming_soon.dart';
import 'package:flutter_responseuiapp/screens/common_bottom_navigation_bar.dart';
import 'package:flutter_responseuiapp/screens/search_page.dart';
import 'package:provider/provider.dart';
import 'screens.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  bool _isScrollableToTopAtHome = true;
  bool _isScrollableToTopAtSearch = true;
  bool _isScrollableToTopAtComingSoon = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<Repository>(
      builder: (context, repo, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            extendBody: true,
            // backgroundColor: HexColor('#F5F5F5'),
            bottomNavigationBar: Material(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(33.0),
              ),
              elevation: 15,
              shadowColor: Colors.black,
              child: AnimatedBottomNavigationBar(
                icons: [
                  Icons.home,
                  Icons.search,
                  Icons.queue_play_next,
                  Icons.file_download,
                  Icons.menu,
                ],
                iconSize: 23.0,
                elevation: 15.0,
                backgroundColor: Colors.black,
                activeIndex: repo.selectedIndex,
                activeColor: Colors.white,
                splashColor: Colors.grey.shade900,
                inactiveColor: Colors.grey,
                splashSpeedInMilliseconds: 300,
                notchSmoothness: NotchSmoothness.defaultEdge,
                leftCornerRadius: 32,
                rightCornerRadius: 32,
                onTap: (index) {
                  if (index == repo.selectedIndex) {
                    if (index == 0) {
                      repo.homeScrollController.animateTo(
                        0.0,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                      );
                    } else if (index == 1) {
                        repo.searchpageScrollController.animateTo(
                          0.0,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                        );
                    }
                    else if (index == 2) {
                        repo.comingsoonScrollController.animateTo(
                          0.0,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                        );
                    }
                  } else return repo.selectedIndex = index;
                },
              ),
            ),
            body: CommonBottomNavigationBar(
              selectedIndex: repo.selectedIndex,
              navigatorKeys: _navigatorKeys,
              childrens: [
                HomeScreen(scrollController: repo.homeScrollController,),
                SearchPage(scrollController: repo.searchpageScrollController,),
                ComingSoon(scrollController: repo.comingsoonScrollController,),
                Scaffold(),
                Scaffold(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
