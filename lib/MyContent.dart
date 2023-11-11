import 'package:flutter/material.dart';

class MyContent extends StatelessWidget {
  final String tabName;
  final String contentText;

  const MyContent(this.tabName, this.contentText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tabName,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            contentText,
            style: const TextStyle(
              fontSize: 20,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
