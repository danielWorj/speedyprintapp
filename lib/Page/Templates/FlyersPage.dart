import 'package:flutter/material.dart';
import 'package:speedy/Page/Templates/component/ImageTemplate.dart';

import '../../component/services/ServicesCard.dart';
import '../DescriptionService.dart';

class FlyesPage extends StatefulWidget {
  const FlyesPage({super.key});

  @override
  State<FlyesPage> createState() => _FlyesPageState();
}

class _FlyesPageState extends State<FlyesPage> {
  //On a crée une classe Service qui prend le nom de l'image et son url

  List<ServiceCard> services = [
    ServiceCard('Flyers ', "5000 Xaf", "f3.jpg", "2"),
    ServiceCard('Flyers ', "5000 Xaf", "f4.jpg", "2"),
    ServiceCard('Flyers ', "5000 Xaf", "f2.jpg", "2"),
    ServiceCard('Flyers ', "5000 Xaf", "flyers.jpg", "2"),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Descriptionservice(
                                      nomService: "Flyers", type: "2")));
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
