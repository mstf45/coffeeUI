import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SepetPage extends StatefulWidget {
  const SepetPage(
      {Key? key,
      required this.imgPath,
      required this.title,
      required this.fiyat})
      : super(key: key);

  final String imgPath;
  final String title;
  final int fiyat;
  @override
  State<SepetPage> createState() => _SepetPageState();
}

class _SepetPageState extends State<SepetPage> {
  int counter = 1;
  int totalPrice = 0;
  void sayacArttir() {
    setState(() {
      counter++;
      totalPrice = widget.fiyat * counter;
    });
  }

  void sayacAzalt() {
    setState(() {
      if (counter > 1) {
        counter--;
        totalPrice = widget.fiyat * counter;
      }
    });
  }

  bool _isFavorite = false;
  bool _isedit = false;
  bool _isDelete = false;
  @override
  void initState() {
    sayacArttir();
    sayacAzalt();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Positioned(
                      top: 70,
                      left: 10,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 255, 216, 42),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Slidable(
                    groupTag: 0,
                    key: UniqueKey(),
                    startActionPane: ActionPane(
                      extentRatio: 0.25,
                      motion: const ScrollMotion(),
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isFavorite = !_isFavorite;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Icon(
                              Icons.favorite_rounded,
                              size: 35,
                              color: _isFavorite ? Colors.red : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                      extentRatio: 0.30,
                      motion: const ScrollMotion(),
                      children: [
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isedit = !_isedit;
                            });
                          },
                          child: Icon(
                            Icons.edit,
                            size: 35,
                            color: _isedit ? Colors.black : Colors.white,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isDelete = !_isDelete;
                            });
                          },
                          child: Icon(
                            Icons.delete,
                            size: 35,
                            color: _isDelete ? Colors.black : Colors.white,
                          ),
                        ),
                        const SizedBox(width: 15),
                      ],
                    ),
                    child: Container(
                      // color: Colors.white,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade600,
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: Image(image: AssetImage(widget.imgPath)),
                        title: Text(widget.title),
                        subtitle: Text(totalPrice.toString()),
                        trailing: Column(
                          children: [
                            const Spacer(),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      sayacAzalt();
                                    });
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                      color: Colors.blue,
                                    ),
                                    child: const Icon(Icons.remove),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () {
                                    sayacArttir();
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                      color: Colors.blue,
                                    ),
                                    child: const Icon(Icons.add),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(counter.toString()),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
