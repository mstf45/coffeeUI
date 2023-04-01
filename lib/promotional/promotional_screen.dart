import 'package:coffee/promotional/promotion_pages/page_1.dart';
import 'package:coffee/promotional/promotion_pages/page_2.dart';
import 'package:coffee/promotional/promotion_pages/page_3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../pages/home_page.dart';

class SmothPages extends StatefulWidget {
  const SmothPages({Key? key}) : super(key: key);

  @override
  State<SmothPages> createState() => _SmothPagesState();
}

class _SmothPagesState extends State<SmothPages> {
  final PageController _controller = PageController();
  bool _islastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                _islastPage = (value == 2);
              });
            },
            controller: _controller,
            children: const [
              introPage1(),
              introPage2(),
              introPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Text('Skip'),
                ),
                SmoothPageIndicator(
                  effect: const WormEffect(
                    dotColor: Colors.white,
                    activeDotColor: Colors.blue,
                  ),
                  controller: _controller,
                  count: 3,
                ),
                _islastPage
                    ? GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePages(),
                      ),
                    );
                  },
                  child: const Text('done'),
                )
                    : GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.linear,
                    );
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
