import 'package:duolingo_app/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import '../utils/images.dart';
import '../widgets/appbar_homescreen.dart';
import '../home/screen/profile_screen.dart';
import '../home/screen/stories_screen.dart';
import '../home/screen/social_screen.dart';
import '../home/screen/store_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _selectedIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(
      key: PageStorageKey('Page1'),
    ),
    StoriesScreen(
      key: PageStorageKey('Page2'),
    ),
    ProfileScreen(
      key: PageStorageKey('Page3'),
    ),
    SocialScreen(
      key: PageStorageKey('Page4'),
    ),
    StoreScreen(
      key: PageStorageKey('Page5'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarHomeScreen(),
      ),
      body: PageStorage(
        bucket: bucket,
        child: screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          bottomNavbarItem(Images.tabLearn, Images.activeLearn, "Home"),
          bottomNavbarItem(Images.tabProfile, Images.activeProfile, "Profile"),
          // bottomNavbarItem(Images.tabStories, Images.activeStories),
          // bottomNavbarItem(Images.tabChat, Images.activeChat),
          // bottomNavbarItem(Images.tabStore, Images.activeStore),
        ],
      ),
    );
  }
}

BottomNavigationBarItem bottomNavbarItem(
    Widget image, Widget activeImage, String label) {
  return BottomNavigationBarItem(
    icon: image,
    label: label,
    activeIcon: activeImage,
  );
}
