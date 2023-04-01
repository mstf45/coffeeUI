import 'package:coffee/pages/favorite_pages.dart';
import 'package:coffee/pages/home_page.dart';
import 'package:coffee/pages/notifications_pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

var sayfaListesi = [
  const HomePages(),
  const FavoritePages(),
  const NotificationsPages(),
];
int secilenIndex = 0;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: sayfaListesi[secilenIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outlined),
              activeIcon: Icon(
                Icons.favorite_rounded,
                color: Colors.red,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
          elevation: 0,
          iconSize: 30,
          currentIndex: secilenIndex,
          onTap: (value) {
            setState(() {
              secilenIndex = value;
            });
          },
        ),
      ),
    );
  }
}
