import 'package:flutter/material.dart';
import 'package:speedy/Controller/Paiement/PaiementController.dart';
import 'package:speedy/Repository/Paiement/PaiementRepositoryImpl.dart';
import 'package:speedy/color/color.dart';

class StripePage extends StatefulWidget {
  const StripePage({super.key});

  @override
  State<StripePage> createState() => _StripePageState();
}

class _StripePageState extends State<StripePage> {
  String clientSecret = "";
  final paiementController = PaiementController(PaiementrepositoryImpl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test stripe"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            //makePayment(context)
          },
          child: Container(
            child: Text('Pay Now', style: TextStyle(color: black)),
          ),
        ),
      ),
    );
  }

  /**void displayPayementSheet(BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Paid successfully!")));
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      if (kDebugMode) {
        print('Error is :----->$e');
      }
    }
  }*/

  /** Future<void> makePayment(BuildContext context) async {
    await Stripe.instance
        .initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        style: ThemeMode.light,
        customFlow: false,
        merchantDisplayName: 'SPEEDY PRINT',
      ),
    )
        .then((value) {
      displayPayementSheet(context);
    });
  }*/
}
