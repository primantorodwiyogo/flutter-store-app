import 'dart:ui';

import 'package:flutter/material.dart';

import '../../models/allproduct.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.allproduct});
  final AllProduct allproduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.blueGrey.shade100,
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child:
                          Image.network(allproduct.image, fit: BoxFit.cover)),
                  Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(144),
                          child: Image.network(
                            allproduct.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 550),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            allproduct.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(allproduct.category),
                                Text(allproduct.price.toString())
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Card(
                  //         color: Colors.transparent,
                  //         child: IconButton(
                  //             onPressed: () {
                  //               Navigator.pop(context);
                  //             },
                  //             icon: Icon(Icons.arrow_back_ios)),
                  //       ),
                  //       Card(
                  //         color: Colors.transparent,
                  //         child: IconButton(
                  //             onPressed: () {}, icon: Icon(Icons.favorite)),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(allproduct.description),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              // primary: Colors.green,
              // onPrimary: Colors.white,
              shadowColor: Colors.greenAccent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              minimumSize: const Size(200, 40), //////// HERE
            ),
            onPressed: () {},
            child: Row(
              children: [
                const Text('Buy'),
                const SizedBox(
                  width: 10,
                ),
                Text(allproduct.price.toString()),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
        ],
      ),
    );
  }
}
