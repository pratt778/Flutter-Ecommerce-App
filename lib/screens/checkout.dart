import 'package:ecommerce_app_flutter/screens/home.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  final String fullname;
  final String address;
  final String email;
  final String phone;
  final String country;
  final double totalprice;
  final cart;
  const CheckoutPage(
      {super.key,
      required this.fullname,
      required this.address,
      required this.country,
      required this.email,
      required this.phone,
      required this.totalprice,
      required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Full Name: $fullname"),
            Text("Full Address: $address"),
            Text("Email Address: $email"),
            Text("Phone Number: $phone"),
            Text("Country: $country"),
            Expanded(
                child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final product = cart[index];
                return Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Image.network(
                            product["image"],
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(product["name"]),
                          Text("Rs." +
                              product["price"].toString() +
                              " X ${product["quantity"]}"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              "Total: ${double.parse(product["price"]) * product["quantity"]}")
                        ],
                      ),
                    ],
                  ),
                );
              },
            )),
            Text("Total price for all the product:${totalprice.toString()}"),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Order has been succesfully placed")));
                Future.delayed(Duration(seconds: 2), () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homepage()));
                });
              },
              child: Text("Confirm your Order"),
              style: ButtonStyle(),
            )
          ],
        ),
      ),
    );
  }
}
