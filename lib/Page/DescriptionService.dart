import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speedy/Controller/CommandeControllerInt.dart';
import 'package:speedy/Model/CarteVisite.dart';
import 'package:speedy/Model/Client.dart';
import 'package:speedy/Model/Flyer.dart';
import 'package:speedy/Model/ImageFlyer.dart';
import 'package:speedy/Model/ImageRollUp.dart';
import 'package:speedy/Model/RollUp.dart';
import 'package:speedy/Page/DescriptionServiceUploadPage.dart';
import 'package:speedy/Repository/Commande/CommandeRepositoryImpl.dart';
import 'package:speedy/component/utils/Button.dart';
import 'package:speedy/component/utils/Input.dart';
import 'package:speedy/component/utils/TextArea.dart';

import '../color/color.dart';

class Descriptionservice extends StatefulWidget {
  final String nomService;
  //final String image;
  final String? type;
  const Descriptionservice({
    super.key,
    required this.nomService,
    required this.type,
  });

  @override
  State<Descriptionservice> createState() => _DescriptionserviceState();
}

class _DescriptionserviceState extends State<Descriptionservice> {
  final commandeController = Commandecontrollerint(Commanderepositoryimpl());

  //cartes visite
  TextEditingController nomPrenom = TextEditingController();
  TextEditingController entreprise = TextEditingController();
  TextEditingController fonction = TextEditingController();
  TextEditingController localisation = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController quantite = TextEditingController();

  //flyer et roll up
  TextEditingController titre = TextEditingController();

  String plastification = 'Plastification'; //plastification
  String decoupe = 'carre';

  //flyer
  String peliculage = 'mat'; //plastification
  String dimension = 'A6';
  //Roll Up
  String format = 'Bache';

  int idTypePapier = 1;
  int idTypeImpression = 1;
  int idTypeReliure = 1;
  Uint8List? _image;
  File? selectedImage;
  bool isAnalysed = false;
  TextEditingController dateLivraison = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: Text(widget.nomService),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const Descriptionserviceuploadpage()));
                },
                icon: const Icon(Icons.upload)),
          ],
          centerTitle: true,
        ),
        body: widget.type == "1"
            ? getCarteVisite()
            : widget.type == "2"
                ? getFlyers()
                : widget.type == "3"
                    ? getRollUp()
                    : widget.type == "0"
                        ? getPhoto()
                        : const Text("Erreur de selection"));
  }

  Widget getCarteVisite() {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              //const SizedBox(height: 10,),
              //Image.asset("assets/${widget.image}"),
              const SizedBox(
                height: 50,
                child: Text(
                  "Informations ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primary,
                      fontSize: 20),
                ),
              ),

              widget.type == "1" //cartes visite
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          InputField(
                              hintTxt: "Nom & Prenom",
                              icon: Icons.person,
                              controller: nomPrenom),
                          const SizedBox(
                            height: 10,
                          ),
                          InputField(
                              hintTxt: "Entreprise / Structure",
                              icon: Icons.home,
                              controller: entreprise),
                          const SizedBox(
                            height: 10,
                          ),
                          InputField(
                              hintTxt: "Fonction ",
                              icon: Icons.accessibility_rounded,
                              controller: fonction),
                          const SizedBox(
                            height: 10,
                          ),
                          InputField(
                              hintTxt: "Localisation",
                              icon: Icons.location_on_outlined,
                              controller: localisation),
                          const SizedBox(
                            height: 10,
                          ),
                          InputField(
                              hintTxt: "Quantite",
                              icon: Icons.production_quantity_limits,
                              controller: quantite),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  : widget.type == "2" || widget.type == "3" //flyers et roll up
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              InputField(
                                  hintTxt: "Titre",
                                  icon: Icons.account_box_sharp,
                                  controller: nomPrenom),
                              const SizedBox(
                                height: 10,
                              ),
                              InputField(
                                  hintTxt: "Entreprise / Structure",
                                  icon: Icons.home,
                                  controller: entreprise),
                              const SizedBox(
                                height: 10,
                              ),
                              InputField(
                                  hintTxt: "Localisation",
                                  icon: Icons.location_on_outlined,
                                  controller: localisation),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        )
                      : Text(" "),

              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: dateLivraison,
                  decoration: const InputDecoration(
                      labelText: 'Date Livraison',
                      filled: true,
                      prefixIcon: Icon(Icons.calendar_today),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: secondary))),
                  readOnly: true,
                  onTap: () {
                    selectDate();
                  },
                ),
              ),
              // From here the login Credentials start.
              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Decription",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextAreaCustom(
                          icon: Icons.list_alt_outlined,
                          color: Colors.black,
                          controller: description,
                          pressIcon: () {},
                        ),
                      ),
                    ]),
              ),
              const Text(
                "Importez vos Images",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),

              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.image,
                          size: 30,
                        ),
                        Text(
                          "Gallery",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              const Divider(thickness: 2),

              const SizedBox(height: 10),
              const Text(
                "Plastification : ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 05),
                child: Column(
                  children: [
                    DropdownButton<String>(
                      value: plastification,
                      icon: const Icon(Icons.menu),
                      style: const TextStyle(color: black),
                      underline: Container(
                        height: 2,
                        color: black,
                      ),
                      items: [
                        DropdownMenuItem<String>(
                            value: 'Plastification',
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text('Plastification'))),
                        DropdownMenuItem<String>(
                            value: 'Sans Plastification',
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text('Non Plastifié'))),
                      ],
                      onChanged: (String? newValue) {
                        setState(() {
                          plastification = newValue!;
                          print(plastification);
                        });
                      },
                    ),
                  ],
                ),
              ),
              const Text(
                "Decoupe : ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 05),
                child: Column(
                  children: [
                    DropdownButton<String>(
                      value: decoupe,
                      icon: const Icon(Icons.menu),
                      style: const TextStyle(color: black),
                      underline: Container(
                        height: 2,
                        color: black,
                      ),
                      items: [
                        DropdownMenuItem<String>(
                            value: 'carre',
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text('Carré'))),
                        DropdownMenuItem<String>(
                            value: 'arrondi',
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text('Arrondi'))),
                      ],
                      onChanged: (String? newValue) {
                        setState(() {
                          decoupe = newValue!;
                          print(decoupe);
                        });
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Button(
                    label: "V A L I D E R ",
                    press: () async {
                      //final prefs = await SharedPreferences.getInstance();

                      // Try reading the counter value from persistent storage.
                      // If not present, null is returned, so default to 0.
                      //final idClient = prefs.getInt('id') ?? 0;

                      String fileName = selectedImage!.path.split('/').last;

                      //print("Le client : $idClient");

                      Client client = Client(5, "", "", "", "", "",
                          true); // le 5 de l'id doit changer
                      Cartevisite carteVisite = Cartevisite(
                        1,
                        nomPrenom.text,
                        entreprise.text,
                        fonction.text,
                        localisation.text,
                        description.text,
                        int.tryParse(quantite.text),
                        plastification,
                        decoupe,
                        dateLivraison.text,
                        fileName,
                        client,
                      );
                      print(carteVisite.toString());

                      Future<Cartevisite> carte = commandeController
                          .commandeCarteVisite(carteVisite, selectedImage!);

                      if (carte == null) {
                        print("Carte visite : failed");
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.10,
                                    width: MediaQuery.sizeOf(context).width,
                                    padding: const EdgeInsets.all(02),
                                    child: const Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: Colors.green,
                                              size: 40,
                                            ),
                                            Text(
                                              "Commande Effectué",
                                              style: TextStyle(fontSize: 18),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: success)),
                                ));
                      }
                    },
                    backgroundColor: secondary),
              ),
              const SizedBox(height: 10),
            ],
          )),
    );
  }

  Widget getFlyers() {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              //const SizedBox(height: 10,),
              //Image.asset("assets/${widget.image}"),
              const SizedBox(
                height: 50,
                child: Text(
                  "Informations ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primary,
                      fontSize: 20),
                ),
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Decription",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextAreaCustom(
                          icon: Icons.list_alt_outlined,
                          color: Colors.black,
                          controller: description,
                          pressIcon: () {},
                        ),
                      ),
                    ]),
              ),

              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: InputField(
                    hintTxt: "Quantite",
                    icon: Icons.production_quantity_limits,
                    controller: quantite),
              ),

              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: dateLivraison,
                  decoration: const InputDecoration(
                      labelText: 'Date Livraison',
                      filled: true,
                      prefixIcon: Icon(Icons.calendar_today),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: secondary))),
                  readOnly: true,
                  onTap: () {
                    selectDate();
                  },
                ),
              ),
              // From here the login Credentials start.

              const Text(
                "Importez vos Images",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),

              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.image,
                          size: 30,
                        ),
                        Text(
                          "Gallery",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              const Divider(thickness: 2),

              const SizedBox(height: 10),
              const Text(
                "Peliculage : ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 05),
                child: Column(
                  children: [
                    DropdownButton<String>(
                      value: peliculage,
                      icon: const Icon(Icons.menu),
                      style: const TextStyle(color: black),
                      underline: Container(
                        height: 2,
                        color: black,
                      ),
                      items: [
                        DropdownMenuItem<String>(
                            value: 'Brillant',
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text('Brillant'))),
                        DropdownMenuItem<String>(
                            value: 'mat',
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text('mat'))),
                      ],
                      onChanged: (String? newValue) {
                        setState(() {
                          peliculage = newValue!;
                          print(peliculage);
                        });
                      },
                    ),
                  ],
                ),
              ),
              const Text(
                "Dimension : ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 05),
                child: Column(
                  children: [
                    DropdownButton<String>(
                      value: dimension,
                      icon: const Icon(Icons.menu),
                      style: const TextStyle(color: black),
                      underline: Container(
                        height: 2,
                        color: black,
                      ),
                      items: [
                        DropdownMenuItem<String>(
                            value: 'A4',
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text('A4'))),
                        DropdownMenuItem<String>(
                            value: 'A5',
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text('A5'))),
                        DropdownMenuItem<String>(
                            value: 'A6',
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text('A6'))),
                      ],
                      onChanged: (String? newValue) {
                        setState(() {
                          decoupe = newValue!;
                          print(decoupe);
                        });
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Button(
                    label: "V A L I D E R ",
                    press: () {
                      String fileName = selectedImage!.path.split('/').last;

                      Client client = Client(5, "", "", "", "", "",
                          true); // le 5 de l'id doit changer

                      Flyer flyer = Flyer(
                          1,
                          description.text,
                          int.parse(quantite.text),
                          peliculage,
                          dimension,
                          dateLivraison.text,
                          client);

                      Imageflyer imageflyer = Imageflyer(1, fileName,
                          1); //le 1 sur image flyer est arbitraitre car il va changer dans le repo

                      Future<Flyer> flyerDB = commandeController.commandeFlyer(
                          flyer, imageflyer, selectedImage!);

                      if (flyerDB == null) {
                        print("Carte visite : failed");
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.10,
                                    width: MediaQuery.sizeOf(context).width,
                                    padding: const EdgeInsets.all(02),
                                    child: const Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: Colors.green,
                                              size: 40,
                                            ),
                                            Text(
                                              "Commande Effectué",
                                              style: TextStyle(fontSize: 18),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: success)),
                                ));
                      }
                    },
                    backgroundColor: secondary),
              ),
              const SizedBox(height: 10),
            ],
          )),
    );
  }

  Widget getRollUp() {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              //const SizedBox(height: 10,),
              //Image.asset("assets/${widget.image}"),
              const SizedBox(
                height: 50,
                child: Text(
                  "Informations ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primary,
                      fontSize: 20),
                ),
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Decription",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextAreaCustom(
                          icon: Icons.list_alt_outlined,
                          color: Colors.black,
                          controller: description,
                          pressIcon: () {},
                        ),
                      ),
                    ]),
              ),

              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InputField(
                    hintTxt: "Quantite",
                    icon: Icons.production_quantity_limits,
                    controller: quantite),
              ),

              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: dateLivraison,
                  decoration: const InputDecoration(
                      labelText: 'Date Livraison',
                      filled: true,
                      prefixIcon: Icon(Icons.calendar_today),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: secondary))),
                  readOnly: true,
                  onTap: () {
                    selectDate();
                  },
                ),
              ),
              // From here the login Credentials start.

              const Text(
                "Importez vos Images",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),

              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.image,
                          size: 30,
                        ),
                        Text(
                          "Gallery",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              const Divider(thickness: 2),

              const SizedBox(height: 10),
              const Text(
                "Format : ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 05),
                child: Column(
                  children: [
                    DropdownButton<String>(
                      value: format,
                      icon: const Icon(Icons.menu),
                      style: const TextStyle(color: black),
                      underline: Container(
                        height: 2,
                        color: black,
                      ),
                      items: [
                        DropdownMenuItem<String>(
                            value: 'Bache',
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text('Bache'))),
                        DropdownMenuItem<String>(
                            value: 'SyntiSol',
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text('SyntiSol'))),
                        DropdownMenuItem<String>(
                            value: 'Toile',
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text('toile'))),
                      ],
                      onChanged: (String? newValue) {
                        setState(() {
                          peliculage = newValue!;
                          print(peliculage);
                        });
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Button(
                    label: "V A L I D E R ",
                    press: () {
                      String fileName = selectedImage!.path.split('/').last;
                      Client client = Client(5, "", "", "", "", "",
                          true); // le 5 de l'id doit changer

                      Rollup rollup = Rollup(
                          1,
                          description.text,
                          int.parse(quantite.text),
                          format,
                          dateLivraison.text,
                          client);

                      Imagerollup imageRollUp = Imagerollup(1, fileName,
                          1); //le '1' ci sera remplacé par l'id du roll up dans le repo impl

                      Future<Rollup> rollupSave = commandeController
                          .commandeRollUp(rollup, imageRollUp, selectedImage!);

                      if (rollupSave == null) {
                        print("Carte visite : failed");
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.10,
                                    width: MediaQuery.sizeOf(context).width,
                                    padding: const EdgeInsets.all(02),
                                    child: const Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: Colors.green,
                                              size: 40,
                                            ),
                                            Text(
                                              "Commande Effectué",
                                              style: TextStyle(fontSize: 18),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(color: success)),
                                ));
                      }
                    },
                    backgroundColor: secondary),
              ),
              const SizedBox(height: 10),
            ],
          )),
    );
  }

  Widget getPhoto() {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(top: 10),
          child: const Column(
            children: [
              const Text("Photo"),
            ],
          )),
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
        dateLivraison.text = _picked.toString().split(" ")[0];
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

  /**Widget getAddPart(String type){
    switch (widget.type) {
      case '0':
        return const Text("Photo");
      case '1':
        return const Column(
          children: [
            InputField(hintTxt: "Nom & Prenom", icon: Icons.person, controller: )
          ],
        );
      case '2':
        return const Text("Flyer");
      case '3':
        return const Text("Roll");
      default:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 05),
          child: Column(
            children: [
              DropdownButton<int>(
                value: idTypeImpression,
                icon: const Icon(Icons.menu, color: primary,),
                style: const TextStyle(color: black),
                underline: Container(
                  height: 2,
                  color: black,
                ),
                items: [
                  DropdownMenuItem<int>(
                      value: 1,
                      child: SizedBox(
                          width:
                          MediaQuery.of(context).size.width * 0.8,
                          child: Text('Cartes Visite'))),
                  DropdownMenuItem<int>(
                      value: 2,
                      child: SizedBox(
                          width:
                          MediaQuery.of(context).size.width * 0.8,
                          child: Text('Roll Up'))),

                  DropdownMenuItem<int>(
                      value: 3,
                      child: SizedBox(
                          width:
                          MediaQuery.of(context).size.width * 0.8,
                          child: Text('Flyers'))),
                ],
                onChanged: (int? newValue) {
                  setState(() {
                    idTypeImpression = newValue!;
                  });
                },
              ),
            ],
          ),
        );
    }
  }*/
}
