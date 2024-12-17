import "package:flutter/material.dart";
import 'package:khalti_flutter/khalti_flutter.dart';

class MyPayment extends StatelessWidget {
  const MyPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(publicKey: 'test_public_key_8247b586adab4638944e75fb58692a7d',
    enabledDebugging: true,
     builder: (context,navigatorKey){
      return MaterialApp(
        title: "Khalti Payment",
        navigatorKey: navigatorKey,
        home: const KhaltiPage(),
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
  const KhaltiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          KhaltiScope.of(context).pay(config: PaymentConfig(amount: 50000, productIdentity: "p123", productName: "Jeans Pant"), onSuccess: (success){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Payment successful : ${success.token}")));
          }, onFailure: (fail){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Payment Failed: ${fail.message}')),
                );
          });
        }, child: Text("Pay rs...")),
      ),
    );
  }
}

