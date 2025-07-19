import 'package:flutter/material.dart';
import 'package:speedy/Page/Templates/component/ImageTemplate.dart';

import '../../component/services/ServicesCard.dart';
import '../DescriptionService.dart';

class RollUpPage extends StatefulWidget {
  const RollUpPage({super.key});

  @override
  State<RollUpPage> createState() => _RollUpPageState();
}

class _RollUpPageState extends State<RollUpPage> {
  List<ServiceCard> services = [
    ServiceCard('Roll Up  ', "20000 Xaf", "r2.jpg", "3"),
    ServiceCard('Roll Up ', "20000 Xaf", "r3.jpg", "3"),
    ServiceCard('Roll Up ', "20000 Xaf", "roll.jpg", "3"),
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
                                      nomService: "Roll Up", type: "3")));
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
    ();
  }
}
