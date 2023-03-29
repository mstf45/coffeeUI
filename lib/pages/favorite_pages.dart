import 'package:flutter/material.dart';

class FavoritePages extends StatefulWidget {
  const FavoritePages({Key? key}) : super(key: key);

  @override
  State<FavoritePages> createState() => _FavoritePagesState();
}

class _FavoritePagesState extends State<FavoritePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
              child: Text(
                'Daha tasarımı Bitmedi Bitince Eklenecektir.',
                style: TextStyle(fontSize: 25,color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
