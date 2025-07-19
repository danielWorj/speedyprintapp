import 'package:flutter/material.dart';
import 'package:speedy/Page/Templates/component/ImageTemplate.dart';

import '../../component/services/ServicesCard.dart';

class Cartesvisitepage extends StatefulWidget {
  const Cartesvisitepage({super.key});

  @override
  State<Cartesvisitepage> createState() => _CartesvisitepageState();
}

class _CartesvisitepageState extends State<Cartesvisitepage> {
  List<ServiceCard> services = [
    ServiceCard('Cartes ', "5000 Xaf", "c2.jpg", "1"),
    ServiceCard('Cartes ', "5000 Xaf", "c3.jpg", "1"),
    ServiceCard('Cartes ', "5000 Xaf", "cartes.jpg", "1"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 2));
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: services.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          child: ImageTemplate(
                        image: services[index].imageURL,
                        press: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=> Descriptionservice(nomService: "Carte de Visite", type: "1")));
                        },
                      ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
