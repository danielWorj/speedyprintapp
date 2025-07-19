import 'package:flutter/material.dart';
import 'package:speedy/component/utils/CustimCard.dart';

class CarteCommandePage extends StatefulWidget {
  const CarteCommandePage({super.key});

  @override
  State<CarteCommandePage> createState() => _CarteCommandePageState();
}

class _CarteCommandePageState extends State<CarteCommandePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: CustomCard(
              image: "assets/commandep.png",
              titre: "Commande",
              textDescription: "Pater omni potentem ",
              dateText: 'dateText',
              onPress: () {})),
    );
  }
}
