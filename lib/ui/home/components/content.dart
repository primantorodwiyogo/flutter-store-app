import 'package:flutter/material.dart';

// import '../../../models/allproduct.dart';
import '../../../models/product.dart';
import '../../details/detail.dart';

class ContentHome extends StatelessWidget {
  const ContentHome({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DetailScreen(product: product);
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.network(
                  product.image,
                  // scale: 6,
                  // height: 100,
                  // width: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              product.title,
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('\$ ${product.price}'),
                MaterialButton(onPressed: () {}, child: const Text("Buy"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
