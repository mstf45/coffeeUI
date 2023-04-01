import 'package:flutter/material.dart';

class introPage3 extends StatefulWidget {
  const introPage3({Key? key}) : super(key: key);

  @override
  State<introPage3> createState() => _introPage3State();
}

class _introPage3State extends State<introPage3> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Sayfa 3'),
      ),
    );
  }
}
