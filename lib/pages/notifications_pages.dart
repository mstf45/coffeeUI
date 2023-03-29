import 'package:flutter/material.dart';

class NotificationsPages extends StatefulWidget {
  const NotificationsPages({Key? key}) : super(key: key);

  @override
  State<NotificationsPages> createState() => _NotificationsPagesState();
}

class _NotificationsPagesState extends State<NotificationsPages> {
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
                style: TextStyle(fontSize: 25, color: Colors.blue),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
