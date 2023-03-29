import 'package:coffee/pages/sepet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> textList = [
      'Türk Kahvesi',
      'Espresso',
      'Latte',
      'Americano',
      'Cappuccino',
    ];
    List<String> imgList = [
      'assets/türk_kahvesi.png',
      'assets/espresso.png',
      'assets/latte.png',
      'assets/americano.png',
      'assets/cappuccino.png'
    ];
    List<String> tabslar = [
      'Türk Kahvesi',
      'Espresso',
      'Latte',
      'Americano',
      'Cappuccino',
      'Diğerleri',
    ];
    List<int> fiyatListesi = [
      10,
      20,
      30,
      40,
      50,
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: Column(
        children: [
          //Find the best coffe for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Find the best coffe for you',
              style: GoogleFonts.bebasNeue(fontSize: 40),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
                prefixIcon: const Icon(Icons.search),
                hintText: 'Find your coffee...',
              ),
            ),
          ),
          const SizedBox(height: 25),

          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < tabslar.length; i++)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = i;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            tabslar[i],
                            style: TextStyle(
                              color: selectedIndex == i
                                  ? Colors.orange
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < textList.length; i++)
                  Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: MediaQuery.of(context).size.height / 3,
                    width: 170,
                    //color: Colors.grey,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade800,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image(
                            image: AssetImage(
                              imgList[i],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  textList[i],
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(fiyatListesi[i].toString()),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SepetPage(
                                      title: textList[i],
                                      fiyat: fiyatListesi[i],
                                      ImgPath: imgList[i],
                                    ),
                                  ),
                                );
                              },
                              child: const CircleAvatar(
                                backgroundColor: Colors.orange,
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15)
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
