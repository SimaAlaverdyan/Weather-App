import 'package:flutter/material.dart';

// class MyBottomBar extends StatelessWidget {
//   final int currentTabIndex;
//   final Function(int) onTabClick;
//   // final _pageViewController = PageController(initialPage: 0);

//   MyBottomBar({
//     super.key,
//     required this.currentTabIndex,
//     required this.onTabClick,
//   });

// // @override
// //   void dispose() {
// //     _pageViewController.dispose();
// //     super.dispose();
// //   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: currentTabIndex,
//       onTap: onTabClick,
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.access_time),
//           label: "Currently",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.today),
//           label: "Today",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.calendar_today),
//           label: "Weekly",
//         ),
//       ],
//     );
//   }
// }

class MyBottomBar extends StatefulWidget {
  final int currentTabIndex;
  final Function(int) onTabClick;

  const MyBottomBar({
    super.key,
    required this.currentTabIndex,
    required this.onTabClick,
  });

  @override
  State<MyBottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<MyBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentTabIndex,
      onTap: widget.onTabClick,
      // onTap: (index) {
      //   setState(() {
      //     widget.currentTabIndex = index;
      //   });
      //   widget.onTabClick(index);
      // },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          label: "Currently",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.today),
          label: "Today",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: "Weekly",
        ),
      ],
    );
  }
}
