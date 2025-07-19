import 'package:flutter/material.dart';
import 'package:speedy/color/color.dart';

class Detailscommande extends StatefulWidget {
  const Detailscommande({super.key});

  @override
  State<Detailscommande> createState() => _DetailscommandeState();
}

class _DetailscommandeState extends State<Detailscommande> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset("assets/cartes.jpg"),
            const Text(
              "INTITULE COMMANDE",
              style: const TextStyle(
                  color: black, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2),
            const Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              " Lorem ipsum dolor sit amet, consectetur adipisicing elit.\n Aspernatur sit aperiam adipisci cupiditate unde consequuntur fugiat nulla accusantium nesciunt facere",
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              " Lorem ipsum dolor sit amet, consectetur adipisicing elit.\n Aspernatur sit aperiam adipisci cupiditate unde consequuntur fugiat nulla accusantium nesciunt facere",
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              " Lorem ipsum dolor sit amet, consectetur adipisicing elit.\n Aspernatur sit aperiam adipisci cupiditate unde consequuntur fugiat nulla accusantium nesciunt facere",
            ),
          ],
        ),
      ),
    );
  }
}
