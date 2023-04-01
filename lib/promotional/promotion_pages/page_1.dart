import 'package:flutter/material.dart';

class introPage1 extends StatefulWidget {
  const introPage1({Key? key}) : super(key: key);

  @override
  State<introPage1> createState() => _introPage1State();
}

class _introPage1State extends State<introPage1> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Sayfa 1'),
      ),
    );
  }
}
