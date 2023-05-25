import 'dart:ui';

import 'package:flutter/material.dart';

import '../../models/product.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});
  final Product product;

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
                      child: Image.network(product.image, fit: BoxFit.cover)),
                  Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(144),
                          child: Image.network(
                            product.image,
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
                            product.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(product.category),
                                Text(product.price.toString())
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(product.description),
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
              shadowColor: Colors.greenAccent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              minimumSize: const Size(200, 40),
            ),
            onPressed: () {},
            child: Row(
              children: [
                const Text('Buy'),
                const SizedBox(
                  width: 10,
                ),
                Text(product.price.toString()),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
        ],
      ),
    );
  }
}
