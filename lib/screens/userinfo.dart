import 'package:ecommerce_app_flutter/screens/checkout.dart';
import 'package:flutter/material.dart';
import '../models/cart.dart';

class UserInfoPage extends StatefulWidget {
  UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final TextEditingController _fullnamecontroller = TextEditingController();

  final TextEditingController _addresscontroller = TextEditingController();

  final TextEditingController _mailcontroller = TextEditingController();

  final TextEditingController _numbercontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  String? _selectedCountry;
  bool _isTermAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  controller: _fullnamecontroller,
                  decoration: InputDecoration(
                    hintText: "Enter you Name",
                    labelText: "Full Name",
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? "Enter your full name"
                      : null,
                ),
                TextFormField(
                  controller: _addresscontroller,
                  decoration: InputDecoration(
                    labelText: "Full Address",
                    hintText: "Enter your full address",
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? "Enter your full Address"
                      : null,
                ),
                TextFormField(
                  controller: _mailcontroller,
                  decoration: InputDecoration(
                      labelText: "Email Address",
                      hintText: "Enter your Email Address"),
                  validator: (value) => value == null || value.isEmpty
                      ? "Enter your Email Address"
                      : null,
                ),
                TextFormField(
                  controller: _numbercontroller,
                  decoration: InputDecoration(
                      labelText: "Phone Number",
                      hintText: "Enter your Phone Number"),
                  validator: (value) => value == null || value.isEmpty
                      ? "Enter your phone number"
                      : null,
                ),
                DropdownButtonFormField<String>(
                    value: _selectedCountry,
                    decoration: InputDecoration(labelText: "Country"),
                    items: ["Nepal", "China", "USA", "Japan", "Singapore"]
                        .map((country) {
                      return DropdownMenuItem(
                        child: Text(country),
                        value: country,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCountry = value;
                      });
                    }),
                CheckboxListTile(
                    title: Text("I accept all the terms and conditions"),
                    value: _isTermAccepted,
                    onChanged: (value) {
                      setState(() {
                        _isTermAccepted = value!;
                      });
                    }),
                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        print("this is printed keyyy");
                        if (!_isTermAccepted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "Please agree with our terms and conditions")));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckoutPage(
                                      fullname: _fullnamecontroller.text,
                                      address: _addresscontroller.text,
                                      country: _selectedCountry!,
                                      email: _mailcontroller.text,
                                      phone: _numbercontroller.text,
                                      cart: cart,
                                      totalprice: cart.fold(0, (sum, item) {
                                        return sum +
                                            double.parse(item["price"]) *
                                                item['quantity'];
                                      }))));
                        }
                      }
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
