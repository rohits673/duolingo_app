import 'package:duolingo_app/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import '../utils/images.dart';
import '../home/screen/profile_screen.dart';

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
        appBar: AppBar(
          backgroundColor: _light ? Colors.lightGreen[200] : Colors.brown[800],
          elevation: 5,
          // centerTitle: true,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Flutter Quiz",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: _light ? Colors.black : Colors.white,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                icon: _light
                    ? const Icon(Icons.dark_mode)
                    : const Icon(
                        Icons.light_mode,
                      ),
                onPressed: () {
                  setState(() {
                    _light = !_light;
                  });
                },
                color: _light ? Colors.black : Colors.white,
              ),
            ),
          ],
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
