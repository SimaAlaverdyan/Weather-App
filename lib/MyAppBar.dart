import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function(String) updateContentCallback;

  const MyAppBar(this.updateContentCallback, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<MyAppBar> createState() => _MyAppBarState(updateContentCallback);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  final TextEditingController _searchController = TextEditingController();
  final Function(String) updateContentCallback;

  _MyAppBarState(this.updateContentCallback);

  @override
  Widget build(BuildContext context) => Scaffold(
        // backgroundColor: Colors.deepPurple.shade900,
        appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purple.shade300],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            title: TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.white,
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                debugPrint(value);
              },
              onSubmitted: (value) {
                updateContentCallback(value);
                debugPrint("Entered value: $value");
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.location_on),
                onPressed: () {
                  updateContentCallback("Geolocation");
                  debugPrint("Geolocation button is clicked");
                },
              ),
            ]),
        body: const Center(
          child: Text(
            'Search results will appear here',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //         title: TextField(
  //           controller: _searchController,
  //           decoration: const InputDecoration(
  //             border: OutlineInputBorder(),
  //             labelText: "Search",
  //             prefixIcon: Icon(Icons.search),
  //           ),
  //           onChanged: (text) {
  //             debugPrint("Search query: $text");
  //           },
  //         ),
  //         actions: [
  //           IconButton(
  //             icon: const Icon(Icons.location_on),
  //             onPressed: () {
  //               debugPrint("geolocation button is clicked");
  //             },
  //           ),
  //         ]),
  //   );
  // }
}
