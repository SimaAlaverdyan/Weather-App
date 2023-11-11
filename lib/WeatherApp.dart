import 'package:flutter/material.dart';
import 'package:weather_app/MyAppBar.dart';
import 'package:weather_app/MyBottomBar.dart';
import 'package:weather_app/MyContent.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int curIndex = 0;
  final List<String> tabNames = ["Currently", "Today", "Weekly"];
  String contentText = "";
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: curIndex);
    _pageController.addListener(() {
      setState(() {
        curIndex = _pageController.page?.round() ?? 0;
      });
    });
  }

  void onTabClick(int index) {
    setState(() {
      curIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    });
    // debugPrint('$index');
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void updateContent(String value) {
    setState(() {
      if (value != "") {
        contentText = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: MyAppBar(updateContent),
      // body: Center(child: MyContent(tabNames[curIndex], contentText)),
      body: PageView(
        controller: _pageController,
        onPageChanged: onTabClick,
        children: [
          MyContent(tabNames[0], contentText),
          MyContent(tabNames[1], contentText),
          MyContent(tabNames[2], contentText),
        ],
      ),
      bottomNavigationBar: MyBottomBar(
        currentTabIndex: curIndex,
        onTabClick: onTabClick,
      ),
    ));
  }
}
