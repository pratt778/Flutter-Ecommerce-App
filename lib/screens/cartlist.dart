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
      totalprice += double.parse(cart[i]["price"]);
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
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: ListTile(
                              leading: Image.network(
                                item["image"],
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                              title: Text(item["name"]),
                              subtitle: Text(item["price"]),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        print("Delete btn");
                                        setState(() {
                                          cart.removeAt(index);
                                        });
                                      },
                                      child: Icon(Icons.delete))
                                ],
                              ),
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
                )
              ],
            ),
    );
  }
}
