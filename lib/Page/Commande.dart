import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speedy/Page/Commande/DetailsCommande.dart';
import 'package:speedy/color/color.dart';
import 'package:speedy/component/utils/CardCommande.dart';

class Commande extends StatefulWidget {
  final bool? isTemplate;
  final String? image;
  const Commande({super.key, this.isTemplate, this.image});

  @override
  State<Commande> createState() => _CommandeState();
}

class _CommandeState extends State<Commande> {
  TextEditingController description = TextEditingController();
  int idTypePapier = 1;
  int idTypeImpression = 1;
  int idTypeReliure = 1;
  Uint8List? _image;
  File? selectedImage;
  bool isAnalysed = false;
  TextEditingController datePickedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Commande',
          style: TextStyle(color: white),
        ),
        backgroundColor: primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Cardcommande(
                image: "assets/commande.png",
                title: "Commande 1",
                date: "12-04-2025",
                etat: true,
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detailscommande()));
                }),
            SizedBox(
              height: 20,
            ),
            Cardcommande(
                image: "assets/commande.png",
                title: "Commande 2",
                date: "12-04-2025",
                etat: false,
                press: () {}),
            SizedBox(
              height: 20,
            ),
            Cardcommande(
                image: "assets/commande.png",
                title: "Commande 3",
                date: "12-04-2025",
                etat: true,
                press: () {}),
          ],
        ),
      ),
    );
  }

  Future<void> selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_picked != null) {
      setState(() {
        datePickedController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  //pick image from gallery
  Future _pickImageFromGallery() async {
    final returnImaage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImaage == null) return;
    setState(() {
      selectedImage = File(returnImaage.path);
      _image = File(returnImaage.path).readAsBytesSync();

      // sendImageToAnalyse(selectedImage!);
    });
  }

  //pick image from camera
  Future _pickImageFromCamera() async {
    final returnImaage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImaage == null) return;
    setState(() {
      selectedImage = File(returnImaage.path);
      _image = File(returnImaage.path).readAsBytesSync();
    });
  }
}
