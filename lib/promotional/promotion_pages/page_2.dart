import 'package:flutter/material.dart';

class introPage2 extends StatefulWidget {
  const introPage2({Key? key}) : super(key: key);

  @override
  State<introPage2> createState() => _introPage2State();
}

class _introPage2State extends State<introPage2> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Sayfa 2'),
      ),
    );
  }
}
