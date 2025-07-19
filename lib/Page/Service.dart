import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speedy/Controller/Service/Parametragecontroller.dart';
import 'package:speedy/Page/DescriptionService.dart';
import 'package:speedy/Repository/Service/ParametrageRepoImpl.dart';
import 'package:speedy/color/color.dart';

import '../component/services/ServicesCard.dart';

class Service extends StatefulWidget {
  const Service({super.key});

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  final parametrageController = Parametragecontroller(ParametrageRepoImpl());

  TextEditingController contact = TextEditingController();
  TextEditingController email = TextEditingController();

  List<ServiceCard> services = [
    ServiceCard('Cartes ', "3000 Xaf", "cartes.jpg", "1"),
    ServiceCard('Flyers', "5000 Xaf", "flyers.jpg", "2"),
    ServiceCard('Roll Up', "7000 Xaf", "roll.jpg", "3"),
    ServiceCard('Photo', "10000 Xaf", "photo.jpg", "0"),
  ];
  int selectedService = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primary,
        title: Text(
          'Services',
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text("In Progess"),
      ),
    );
  }

  serviceContainer(
      String image, String name, String price, String type, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedService == index)
            selectedService = -1;
          else
            selectedService = index;
        });
        showDialogModal(name, index + 1);
      },
      child: AnimatedContainer(
        //ca c'est pour l'apparution du cadre bleau sur le service
        duration: Duration(milliseconds: 100),
        padding: EdgeInsets.all(20.0),

        decoration: BoxDecoration(
          color: selectedService == index
              ? Colors.blue.shade50
              : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index
                ? Colors.blue
                : Colors.blue.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset("assets/$image", height: 80),
          const SizedBox(
            height: 20,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 20),
          ),
        ]),
      ),
    );
  }

  showDialogModal(String nom, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Descriptionservice(nomService: nom, type: index.toString())));
  }
}
