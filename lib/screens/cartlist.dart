  import 'package:ecommerce_app_flutter/screens/userinfo.dart';
  import 'package:flutter/material.dart';
import '../models/cart.dart';

class Cartlist extends StatefulWidget {
  const Cartlist({super.key});

  @override
  State<Cartlist> createState() => _CartlistState();
}

class _CartlistState extends State<Cartlist> {
  @override
  Widget build(BuildContext context) {
    double totalprice = 0;
    for (var i = 0; i < cart.length; i++) {
      totalprice += double.parse(cart[i]["price"]) * cart[i]["quantity"];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart List"),
        backgroundColor: Colors.green,
      ),
      body: cart.isEmpty
          ? Center(child: Text("Your Cart LIst is Empty"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        var item = cart[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
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
                                      item["image"],
                                      width: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(item["name"]),
                                    Text("Rs." + item["price"].toString()),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    item["quantity"] > 1
                                        ? IconButton(
                                            onPressed: () {
                                              setState(() {
                                                item["quantity"]--;
                                              });
                                            },
                                            icon: Icon(Icons.arrow_downward))
                                        : SizedBox.shrink(),
                                    Text(item["quantity"].toString()),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            item["quantity"]++;
                                          });
                                        },
                                        icon: Icon(Icons.arrow_upward)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          print("Delete btn");
                                          setState(() {
                                            cart.removeAt(index);
                                          });
                                        },
                                        child: Icon(Icons.delete)),
                                    Text(
                                        "Total= ${double.parse(item["price"]) * item["quantity"]}")
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.blueGrey)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Total price is $totalprice"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserInfoPage()));
                    },
                    child: Text("Proceed to Checkout"))
              ],
            ),
    );
  }
}
