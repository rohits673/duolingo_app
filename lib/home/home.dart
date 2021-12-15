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
    ProfileScreen(
      key: PageStorageKey('Page2'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.amber,
  );

  ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
  );

  bool _light = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _light ? _lightTheme : _darkTheme,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarHomeScreen(_light),
        ),
        body: PageStorage(
          bucket: bucket,
          child: screens[_selectedIndex],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _light = !_light;
            });
          },
          backgroundColor: _light ? Colors.black : Colors.white,
          child: _light
              ? Icon(Icons.dark_mode)
              : Icon(
                  Icons.light_mode,
                  color: Colors.black,
                ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
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
            bottomNavbarItem(
                Images.tabProfile, Images.activeProfile, "Profile"),
          ],
        ),
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
