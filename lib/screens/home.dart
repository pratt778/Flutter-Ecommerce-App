import 'package:ecommerce_app_flutter/data/yourproducts.dart';
import 'package:ecommerce_app_flutter/screens/cartlist.dart';
import 'package:ecommerce_app_flutter/screens/productdetail.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Mero Cart",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
              onPressed: () {
                print("icon pressed");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Cartlist()));
              },
              icon: Icon(
                Icons.shopping_bag,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notification_add,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Products for you",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: yourProduct.length,
                    itemBuilder: (context, index) {
                      var product = yourProduct[index];
                      return InkWell(
                        onTap: () {
                          print(product.p_id);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Productdetail(
                                      productID: product.p_id,
                                      productName: product.p_name,
                                      productPrice: product.price.toString(),
                                      productDesc: product.p_desc,
                                      productImage: product.p_image)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              children: [
                                Image.network(
                                  product.p_image,
                                  height: 67,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Text(product.p_name),
                                Text("Rs." + product.price.toString() + "/-")
                              ],
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
