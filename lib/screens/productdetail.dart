import 'package:ecommerce_app_flutter/models/cart.dart';
import 'package:ecommerce_app_flutter/screens/cartlist.dart';
import 'package:flutter/material.dart';

class Productdetail extends StatelessWidget {
  final int productID;
  final String productName;
  final String productPrice;
  final String productDesc;
  final String productImage;
  const Productdetail(
      {super.key,
      required this.productID,
      required this.productName,
      required this.productPrice,
      required this.productDesc,
      required this.productImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          productName,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                productImage,
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
              // Text(productID.toString()),
              Text(productName),
              Text(productDesc),
              Text(productPrice),
              ElevatedButton(
                  onPressed: () {
                    print(productID);
                    cart.add({
                      "name": productName,
                      "price": productPrice,
                      "image": productImage,
                      "quantity": 1
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("$productName is added to the cart")));
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cartlist()));
                    });
                  },
                  child: Text("Add to cart"))
            ],
          ),
        ),
      ),
    );
  }
}
