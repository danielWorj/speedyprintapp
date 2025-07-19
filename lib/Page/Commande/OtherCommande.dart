import 'package:flutter/material.dart';

class OtherCommande extends StatefulWidget {
  const OtherCommande({super.key});

  @override
  State<OtherCommande> createState() => _OtherCommandeState();
}

class _OtherCommandeState extends State<OtherCommande> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Commande page"),
      ),
    );
  }
}
