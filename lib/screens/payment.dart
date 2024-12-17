import "package:flutter/material.dart";
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:ecommerce_app_flutter/screens/home.dart';

class MyPayment extends StatelessWidget {
  final double totalprice;
  const MyPayment({super.key, required this.totalprice});

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: 'test_public_key_546eb6da05544d7d88961db04fdb9721',
        enabledDebugging: true,
        builder: (context, navigatorKey) {
          return MaterialApp(
            title: "Khalti Payment",
            navigatorKey: navigatorKey,
            home: KhaltiPage(price: totalprice),
            localizationsDelegates: const [
              KhaltiLocalizations.delegate, // Add this line
              // GlobalMaterialLocalizations.delegate,
              // GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'), // English locale
              Locale('ne', 'NP'), // Nepali locale
            ],
          );
        });
  }
}

class KhaltiPage extends StatelessWidget {
  final double price;
  const KhaltiPage({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              KhaltiScope.of(context).pay(
                  config: PaymentConfig(
                      amount: price.toInt() * 100,
                      productIdentity: "p123",
                      productName: "Jeans Pant"),
                  onSuccess: (success) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text("Payment successful : ${success.token}")));
                  },
                  onFailure: (fail) {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text('Payment Failed: ${fail.message}')),

                    //   );
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Order has been succesfully placed")));
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Homepage()));
                    });
                  });
            },
            child: Text("Pay with Khalti")),
      ),
    );
  }
}
