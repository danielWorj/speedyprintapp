import 'package:cinetpay/cinetpay.dart';
import 'package:flutter/material.dart';

class CinetPagePaiement extends StatefulWidget {
  final double prixNetAPayer;
  const CinetPagePaiement({super.key, required this.prixNetAPayer});

  @override
  State<CinetPagePaiement> createState() => _CinetPagePaiementState();
}

class _CinetPagePaiementState extends State<CinetPagePaiement> {
  TextEditingController amountController = TextEditingController();
  Map<String, dynamic>? response;
  Color? color;
  IconData? icon;
  String? message;
  bool show = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const String title = 'Speedy Paid ';
    print("prix standard dans le payement config : " +
        widget.prixNetAPayer.toString());
    return Scaffold(
      body: CinetPayCheckout(
          title: "Paiement",
          configData: const <String, dynamic>{
            'apikey': '9731034965f9bc09a0df37.94572735',
            'site_id': 105895185,
            'notify_url': 'https://mondomaine.com/notify/'
          },
          paymentData: <String, dynamic>{
            'transaction_id': '001',
            'amount': 1000, // this price come from pageCommande.dart
            'currency': 'XAF',
            'channels': 'ALL',
            'description': 'Test de paiement'
          },
          waitResponse: (response) {
            print(response);
          },
          onError: (error) {
            print(error);
          }),
    );
  }
}
