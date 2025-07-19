import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speedy/Controller/CommandeControllerInt.dart';
import 'package:speedy/Controller/Service/Parametragecontroller.dart';
import 'package:speedy/Model/Client.dart';
import 'package:speedy/Model/Commande/EtatCommande.dart';
import 'package:speedy/Model/Service/Conception.dart';
import 'package:speedy/Model/Service/Couleur.dart';
import 'package:speedy/Model/Service/Dimension.dart';
import 'package:speedy/Model/Service/Faces.dart';
import 'package:speedy/Model/Service/FacturationFinition.dart';
import 'package:speedy/Model/Service/Finition.dart';
import 'package:speedy/Model/Service/Format.dart';
import 'package:speedy/Model/Service/Forme.dart';
import 'package:speedy/Model/Service/Grammage.dart';
import 'package:speedy/Model/Service/Impression.dart';
import 'package:speedy/Model/Service/ModeImpression.dart';
import 'package:speedy/Model/Service/Service.dart';
import 'package:speedy/Model/Service/TypePapier.dart';
import 'package:speedy/Page/DescriptionServiceUploadPage.dart';
import 'package:speedy/Page/Paiement/CinetPage.dart';
import 'package:speedy/Page/Service/ImageEditorPage.dart';
import 'package:speedy/Repository/Commande/CommandeRepositoryImpl.dart';
import 'package:speedy/Repository/EndPoint/variable.dart';
import 'package:speedy/Repository/Service/ParametrageRepoImpl.dart';
import 'package:speedy/color/color.dart';
import 'package:speedy/component/utils/Button.dart';
import 'package:speedy/component/utils/TextArea.dart';
import 'package:speedy/component/utils/TextField.dart';

class Pagecommande extends StatefulWidget {
  final int idService;
  final bool isupload;
  const Pagecommande(
      {super.key, required this.idService, required this.isupload});

  @override
  State<Pagecommande> createState() => _PagecommandeState();
}

class _PagecommandeState extends State<Pagecommande> {
  TextEditingController description = TextEditingController();
  TextEditingController dateLivraison = TextEditingController();
  TextEditingController quantite = TextEditingController();
  TextEditingController exemplaire = TextEditingController();
  Uint8List? _image;
  File? selectedImage;
  File? selectImageVerso;

  int selectedModeImpression = 0;
  int selectFormat = 0;
  int selectDimension = 0;
  int selectFace = 0;
  int selectCouleur = 0;
  int selectTypePapier = 0;
  int selectGrammage = 0;
  int selectFinition = 0;
  int selectForme = 0;
  int selectConception = 0;
  int selectImpression = 0;

  final parametrageController = Parametragecontroller(ParametrageRepoImpl());
  final commandeController = Commandecontrollerint(Commanderepositoryimpl());

  //PRix

  bool? conceptionIsChecked = false;
  bool? impressionIsChecked = false;

  int selectPrixConception = 0;

  bool isDescriptionUpload = false;
  double prixStandard = 0.0;
  //
  TextEditingController amountController = TextEditingController();
  Map<String, dynamic>? response;
  Color? color;
  IconData? icon;
  String? message;
  bool show = false;

  @override
  Widget build(BuildContext context) {
    setState(() {
      facturation();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("COMMANDE"),
        centerTitle: true,
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
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const EditImage()));
              },
              icon: const Icon(Icons.edit)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                //const SizedBox(height: 10,),
                //Image.asset("assets/${widget.image}"),

                //si c'est upload
                widget.isupload
                    ? !isDescriptionUpload
                        ? IconButton(
                            onPressed: () async {
                              _pickImageFromGallery();
                              if (selectedImage != null) {
                                isDescriptionUpload = true;
                              }
                            },
                            icon: const Icon(Icons.file_copy))
                        : Column(
                            children: [
                              Image.file(
                                File(selectedImage!.path),
                                fit: BoxFit.cover,
                              )
                            ],
                          )
                    : Column(
                        children: [
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    "Decription",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: TextAreaCustom(
                                      icon: Icons.list_alt_sharp,
                                      color: Colors.black,
                                      controller: description,
                                      pressIcon: () {},
                                    ),
                                  ),
                                ]),
                          ),
                          Column(
                            children: [
                              const Text(
                                "Importez vos Images",
                                style: TextStyle(fontSize: 18),
                              ),
                              Row(
                                children: [
                                  //Les deux supports des icones
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        _pickImageFromGallery();
                                      },
                                      child: const SizedBox(
                                        child: Column(
                                          children: [
                                            const Text(
                                              "Recto",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Icon(
                                              Icons.image,
                                              size: 70,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        _pickImageFromGallery();
                                      },
                                      child: const SizedBox(
                                        child: Column(
                                          children: [
                                            const Text(
                                              "Verso",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Icon(
                                              Icons.image,
                                              size: 70,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
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
                const SizedBox(height: 10),

                //Mode Impression
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  child: FutureBuilder(
                      future: parametrageController
                          .fecthModeImpression(widget.idService),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<ModeImpression> modeImpression = snapshot.data!;
                          if (modeImpression.isNotEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "MODE IMPRESSION  : ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: DropdownButton<int>(
                                    icon: Icon(Icons.print),
                                    isExpanded: true,
                                    hint:
                                        Text(selectedModeImpression.toString()),
                                    items: modeImpression
                                        .map<DropdownMenuItem<int>>((mode) {
                                      return DropdownMenuItem<int>(
                                        value: mode.idModeImpression,
                                        child: Text(mode.intitule!),
                                      );
                                    }).toList(),
                                    onChanged: (
                                      value,
                                    ) {
                                      setState(() {
                                        selectedModeImpression = value!;
                                        print(value);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            );
                          }
                        }
                        return Text("");
                      }),
                ),
                //Type Papier
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  child: FutureBuilder(
                      future: parametrageController
                          .fetchTypePapier(widget.idService),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<TypePapier> typePapier = snapshot.data!;
                          if (typePapier.isNotEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Type Papier  : ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: DropdownButton<int>(
                                    icon: Icon(Icons.paste_outlined),
                                    isExpanded: true,
                                    hint: Text(selectTypePapier.toString()),
                                    items: typePapier
                                        .map<DropdownMenuItem<int>>((tp) {
                                      return DropdownMenuItem<int>(
                                        value: tp.idTypePapier,
                                        child: Text(tp.intitule!),
                                      );
                                    }).toList(),
                                    onChanged: (
                                      value,
                                    ) {
                                      setState(() {
                                        selectTypePapier = value!;
                                        print(value);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            );
                          }
                        }
                        return Text("");
                      }),
                ),
                //Grammage
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  child: FutureBuilder(
                      future:
                          parametrageController.fetchGrammage(widget.idService),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Grammage> grammage = snapshot.data!;
                          if (grammage.isNotEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Grammage  : ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: DropdownButton<int>(
                                    icon: Icon(Icons.print),
                                    isExpanded: true,
                                    hint: Text(selectGrammage.toString()),
                                    items: grammage
                                        .map<DropdownMenuItem<int>>((g) {
                                      return DropdownMenuItem<int>(
                                        value: g.idGrammage,
                                        child: Text(g.intitule!),
                                      );
                                    }).toList(),
                                    onChanged: (
                                      value,
                                    ) {
                                      setState(() {
                                        selectGrammage = value!;
                                        print(value);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            );
                          }
                        }
                        return Text("");
                      }),
                ),
                //Finition
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  child: FutureBuilder(
                      future:
                          parametrageController.fetchFinition(widget.idService),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Finition> finition = snapshot.data!;
                          if (finition.isNotEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Finition  : ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: DropdownButton<int>(
                                    icon: Icon(Icons.print),
                                    isExpanded: true,
                                    hint: Text(selectFinition.toString()),
                                    items: finition
                                        .map<DropdownMenuItem<int>>((f) {
                                      return DropdownMenuItem<int>(
                                        value: f.idFinition,
                                        child: Text(f.intitule!),
                                      );
                                    }).toList(),
                                    onChanged: (
                                      value,
                                    ) {
                                      setState(() {
                                        selectFinition = value!;
                                        print(value);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            );
                          }
                        }
                        return Text("");
                      }),
                ),
                //Formes
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  child: FutureBuilder(
                      future:
                          parametrageController.fetchForme(widget.idService),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Forme> forme = snapshot.data!;
                          if (forme.isNotEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Forme  : ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: DropdownButton<int>(
                                    icon: Icon(Icons.print),
                                    isExpanded: true,
                                    hint: Text(selectForme.toString()),
                                    items:
                                        forme.map<DropdownMenuItem<int>>((f) {
                                      return DropdownMenuItem<int>(
                                        value: f.idForme,
                                        child: Text(f.intitule!),
                                      );
                                    }).toList(),
                                    onChanged: (
                                      value,
                                    ) {
                                      setState(() {
                                        selectForme = value!;
                                        print(value);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            );
                          }
                        }
                        return Text("");
                      }),
                ),
                //Format
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  child: FutureBuilder(
                      future:
                          parametrageController.fecthFormat(widget.idService),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Format> formatList = snapshot.data!;
                          if (formatList.isNotEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "FORMAT  : ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: DropdownButton<int>(
                                    icon: Icon(Icons.folder),
                                    isExpanded: true,
                                    hint: Text(selectFormat.toString()),
                                    items: formatList
                                        .map<DropdownMenuItem<int>>((f) {
                                      return DropdownMenuItem<int>(
                                        value: f.idFormat,
                                        child: Text(f.intitule!),
                                      );
                                    }).toList(),
                                    onChanged: (
                                      value,
                                    ) {
                                      setState(() {
                                        selectFormat = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            );
                          }
                        }
                        return Text("");
                      }),
                ),
                //Dimension
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  child: FutureBuilder(
                      future: parametrageController
                          .fecthDimension(widget.idService),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Dimension> dimensionList = snapshot.data!;
                          if (dimensionList.isNotEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "DIMENSION  : ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: DropdownButton<int>(
                                    icon: Icon(Icons.list_alt),
                                    isExpanded: true,
                                    hint: Text(selectDimension.toString()),
                                    items: dimensionList
                                        .map<DropdownMenuItem<int>>((d) {
                                      return DropdownMenuItem<int>(
                                        value: d.idDimension,
                                        child: Text(d.intitule!),
                                      );
                                    }).toList(),
                                    onChanged: (
                                      value,
                                    ) {
                                      setState(() {
                                        selectDimension = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            );
                          }
                        }
                        return Text("");
                      }),
                ),
                //Faces
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  child: FutureBuilder(
                      future:
                          parametrageController.fetchFaces(widget.idService),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Faces> facesList = snapshot.data!;
                          if (facesList.isNotEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "FACES  : ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: DropdownButton<int>(
                                    icon: Icon(Icons.list_alt),
                                    isExpanded: true,
                                    hint: Text(selectFace.toString()),
                                    items: facesList
                                        .map<DropdownMenuItem<int>>((f) {
                                      return DropdownMenuItem<int>(
                                        value: f.idFaces,
                                        child: Text(f.intitule!),
                                      );
                                    }).toList(),
                                    onChanged: (
                                      value,
                                    ) {
                                      setState(() {
                                        selectFace = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            );
                          }
                        }
                        return Text("");
                      }),
                ),
                //Couleurs
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  child: FutureBuilder(
                      future:
                          parametrageController.fetchCouleur(widget.idService),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Couleur> couleurList = snapshot.data!;
                          if (couleurList.isNotEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "COULEURS  : ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: DropdownButton<int>(
                                    icon: Icon(Icons.color_lens),
                                    isExpanded: true,
                                    hint: Text(selectCouleur.toString()),
                                    items: couleurList
                                        .map<DropdownMenuItem<int>>((c) {
                                      return DropdownMenuItem<int>(
                                        value: c.idCouleur,
                                        child: Text(c.intitule!),
                                      );
                                    }).toList(),
                                    onChanged: (
                                      value,
                                    ) {
                                      setState(() {
                                        selectCouleur = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            );
                          }
                        }
                        return Text("");
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InputField(
                      hintTxt: "Quantite",
                      icon: Icons.shopping_cart_outlined,
                      controller: quantite),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InputField(
                      hintTxt: "Exemplaire ",
                      icon: Icons.shopping_cart_outlined,
                      controller: exemplaire),
                ),
                /*Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  child: FutureBuilder(
                      future: parametrageController
                          .fetchImpression(widget.idService),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          var prixStandard = 0.0;
                          List<Impression> impressionList = snapshot.data!;
                          for (var i = 0; i < impressionList.length; i++) {
                            //Il récupère le prmeir prix entré par l'application web
                            prixStandard = impressionList[0].montant!;
                          }
                          return Text(
                            '$prixStandard XAF',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        return Text("");
                      }),
                ),*/

                /*isDescriptionUpload
                    //si on clique surle bouton upload de la description
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 05),
                        child: FutureBuilder(
                            future: parametrageController
                                .fetchConception(widget.idService),
                            builder: (context, AsyncSnapshot snapshot) {
                              //prix de conception
                              if (snapshot.hasData) {
                                List<Conception> conceptionList =
                                    snapshot.data!;
                                if (conceptionList.isNotEmpty) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "TYPE DE CONCEPTION  : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: DropdownButton<int>(
                                          icon: Icon(Icons.edit),
                                          isExpanded: true,
                                          hint: Text(
                                              selectPrixConception.toString()),
                                          items: conceptionList
                                              .map<DropdownMenuItem<int>>((c) {
                                            return DropdownMenuItem<int>(
                                                value: c.idConception,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                          "${c.typeConception!.intitule!}"),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                          "${c.montant!} XAF"),
                                                    )
                                                  ],
                                                ));
                                          }).toList(),
                                          onChanged: (
                                            value,
                                          ) {
                                            setState(() {
                                              selectPrixConception = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              }
                              return Text("");
                            }),
                      ),*/
                //CONCEPTION

                const SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Button(
                      label: "V A L I D E R ",
                      press: () async {
                        /**var prixTotalExemplaire = 0.0;

                        var prixFacture = await facturation();

                        if (exemplaire.text == '') {
                          prixTotalExemplaire = prixFacture;
                        } else {
                          print("exemplaire : ${int.parse(exemplaire.text)}");
                          var exemplaireValeur = int.parse(exemplaire.text);
                          prixTotalExemplaire = prixFacture * exemplaireValeur;
                        }**/

                        print("payement with cinetpay");

                        facturation();
                        /*Commande commande = Commande(
                            1,
                            100,
                            dateLivraison.text,
                            "",
                            true,
                            description.text,
                            service,
                            client,
                            etatCommande,
                            modeImpression,
                            dimension,
                            format,
                            conception,
                            impression);

                        bool success = await commandeController.createCommande(
                            commande, selectedImage!, selectImageVerso);

                        if (success!) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    content: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.25,
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
                                                Icons.warning,
                                                color: warning,
                                                size: 40,
                                              ),
                                              Text(
                                                "L'opérateur de paiement en ligne n'est pas encore disponible.\n Speedy print vous contactera pour terminer l'opération. Merci!",
                                                style: TextStyle(fontSize: 18),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    backgroundColor: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                        side: BorderSide(color: white)),
                                  ));
                        }*/
                      },
                      backgroundColor: primary),
                ),
                const SizedBox(height: 10),
              ],
            )),
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

  Future _pickImageVersoFromGallery() async {
    final returnImaage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImaage == null) return;
    setState(() {
      selectImageVerso = File(returnImaage.path);
      _image = File(returnImaage.path).readAsBytesSync();

      // sendImageToAnalyse(selectedImage!);
    });
  }

  Future<Widget> facturation() async {
    int idClient = 3;
    Service service = Service(widget.idService, " ", "", "",
        categorieserviceVar); //categorieVar ne sera pas utilisé par le backend , on ne va utiliser que l'id
    Client client = Client(3, "", "", "", "", "", true);
    EtatCommande etatCommande = EtatCommande(1, "");

    print("mode impression : $selectedModeImpression");
    ModeImpression modeImpressionF = selectedModeImpression != 0
        ? await parametrageController
            .fetchModeImpressionById(selectedModeImpression)
        : modeImpressionVar;
    Dimension dimensionF = selectDimension != 0
        ? await parametrageController.fetchDimensionById(selectDimension)
        : dimensionVar;
    Format formatF = selectFormat != 0
        ? await parametrageController.fetchFormatById(selectFormat)
        : formatVar;
    TypePapier typePapierF = selectTypePapier != 0
        ? await parametrageController.fetchTypePapierById(selectTypePapier)
        : typePapierVar;

    print('le type de papier recerché dans la vue est  :' +
        typePapierF.toString());

    Grammage grammageF = selectGrammage != 0
        ? await parametrageController.fetchGrammageById(selectGrammage)
        : grammageVar;
    Finition finitionF = selectFinition != 0
        ? await parametrageController.fetchFinitionById(selectFinition)
        : finitionVar;
    Forme formeF = selectForme != 0
        ? await parametrageController.fetchFormeById(selectForme)
        : formesVar;
    Couleur couleurF = selectCouleur != 0
        ? await parametrageController.fetchCouleurById(selectCouleur)
        : couleurVar;
    Faces facesF = selectFace != 0
        ? await parametrageController.fetchFacesById(selectFace)
        : facesVar;

    Conception conceptionF = selectConception != 0
        ? await parametrageController.fetchConceptionById(selectConception)
        : conceptionVar;
    Impression impressionF = selectImpression != 0
        ? await parametrageController.fetchImpressionById(selectImpression)
        : impressionVar;

    List<Impression> impressionList =
        await parametrageController.fetchImpression(widget.idService!);

    List<Facturationfinition> facturationFinitionList =
        await parametrageController
            .fetchFacturationFinition(finitionF!.idFinition!);

    //Recherche du orix correspondant à  la quantité
    var prixStandardImpression = 0.0; //A afficher sur l'écran

    for (var i = 0; i < impressionList.length; i++) {
      //Il récupère le prmeir prix entré par le client
      prixStandardImpression = impressionList[0].montant!;
    }
    print("print standard:  $prixStandardImpression");

    var prixCorrespondantQuantite = 0.0;
    var remiseQuantite = 0.0;

    for (var i = 0; i < impressionList.length; i++) {
      print("borne inferieure : ${impressionList[i].borneInferieure}");

      if (impressionList[i].borneInferieure! < int.parse(quantite.text) &&
          int.parse(quantite.text) < impressionList[i].borneSuperieure!) {
        print("borne inferieure : ${impressionList[i].borneInferieure}");

        print("Dans l'iintervale");

        prixCorrespondantQuantite = impressionList[i].montant!;

        remiseQuantite = impressionList[i].remise!;
      }
    }

    var valeurAjoutFinition = 0.0;
    var valeurMultiplicationFinition = 1.0;

    for (var i = 0; i < facturationFinitionList.length; i++) {
      print(
          "borne inferieure de la finition  : ${facturationFinitionList[i].borneInferieure}");

      if (facturationFinitionList[i].borneInferieure! <
              int.parse(quantite.text) &&
          int.parse(quantite.text) <
              facturationFinitionList[i].borneSuperieure!) {
        print(
            "borne inferieure : ${facturationFinitionList[i].borneInferieure}");

        print("Dans l'iintervale");

        if (facturationFinitionList[i].valeurAjout != 0 &&
            facturationFinitionList[i].valeurMultiplication == 1) {
          valeurAjoutFinition = facturationFinitionList[i].valeurAjout!;
        } else if (facturationFinitionList[i].valeurMultiplication != 1 &&
            facturationFinitionList[i].valeurAjout == 0) {
          valeurMultiplicationFinition =
              facturationFinitionList[i].valeurMultiplication!;
        }
      }
    }

    print(
        "print impression corespondant  quantite :  $prixCorrespondantQuantite");
    print("print impression remise  quantite :  $remiseQuantite");

    var prixImpressionWithQuantite =
        prixCorrespondantQuantite * int.parse(quantite.text);

    print("print impression with quantite :  $prixImpressionWithQuantite");

    var prixConception = selectConception != 0 ? conceptionF.montant : 0;
    var prixInitialImpression = impressionF.montant;

    var prixTotalImpression = (prixImpressionWithQuantite! *
            (modeImpressionF.valeurMultiplication! *
                formatF.valeurMultiplication! *
                dimensionF.valeurMultiplication! *
                typePapierF.valeurMultiplication! *
                grammageF.valeurMultiplication! *
                //finitionF.valeurMultiplication! *
                formeF.valeurMultiplication! *
                facesF.valeurMultiplication! *
                valeurMultiplicationFinition) +
        (modeImpressionF.valeurAjout! +
            formatF.valeurAjout! +
            dimensionF.valeurAjout! +
            typePapierF.valeurAjout! +
            facesF.valeurAjout! +
            grammageF.valeurAjout! +
            //finitionF.valeurAjout! +
            formeF.valeurAjout! +
            valeurAjoutFinition));

    var prixAchat = prixConception! +
        prixTotalImpression * (remiseQuantite == 0 ? 1 : remiseQuantite);

    //widget à retourner
    var prixExemplaire = 0.0;

    prixExemplaire = prixAchat;
    return await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Facture ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                //on va lister les caractéristiques de sa commande

                //Mode Impression
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  child: FutureBuilder(
                      future: parametrageController
                          .fecthModeImpression(widget.idService),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<ModeImpression> modeImpression = snapshot.data!;
                          if (modeImpression.isNotEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(children: [
                                    const Text(
                                      "Mode Impression : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${modeImpressionF!.intitule!} ",
                                    ),
                                  ]),
                                ),
                              ],
                            );
                          }
                        }
                        return Text("");
                      }),
                ),
                //Type Papier
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  child: FutureBuilder(
                      future: parametrageController
                          .fetchTypePapier(widget.idService),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<TypePapier> typePapier = snapshot.data!;

                          if (typePapier.isNotEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(children: [
                                    const Text(
                                      "Papier : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${typePapierF!.intitule!} ",
                                    ),
                                  ]),
                                ),
                              ],
                            );
                          }
                        }
                        return Text("");
                      }),
                ),
                //Grammage
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  child: FutureBuilder(
                      future:
                          parametrageController.fetchGrammage(widget.idService),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Grammage> grammage = snapshot.data!;
                          if (grammage.isNotEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(children: [
                                    const Text(
                                      "Grammage  : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    selectGrammage != 0
                                        ? Text(
                                            "${grammageF!.intitule!}",
                                          )
                                        : Text(
                                            "${impressionList[0].grammage?.intitule!}",
                                          )
                                  ]),
                                ),
                              ],
                            );
                          }
                        }
                        return Text("");
                      }),
                ),
                //Finition
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  child: FutureBuilder(
                      future:
                          parametrageController.fetchFinition(widget.idService),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Finition> finition = snapshot.data!;
                          if (finition.isNotEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(children: [
                                    const Text(
                                      "Finition : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    selectFinition != 0
                                        ? Text(
                                            "${finitionF!.intitule!}",
                                          )
                                        : Text(
                                            "${impressionList[0].finition?.intitule!}",
                                          )
                                  ]),
                                ),
                              ],
                            );
                          }
                        }
                        return Text("");
                      }),
                ),
                //Formes
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  child: FutureBuilder(
                      future:
                          parametrageController.fetchForme(widget.idService),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Forme> forme = snapshot.data!;
                          if (forme.isNotEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(children: [
                                    const Text(
                                      "Forme : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    selectForme != 0
                                        ? Text(
                                            "${formeF!.intitule!}",
                                          )
                                        : Text(
                                            "${impressionList[0].forme?.intitule!}",
                                          )
                                  ]),
                                ),
                              ],
                            );
                          }
                        }
                        return Text("");
                      }),
                ),
                //Format
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  child: FutureBuilder(
                      future:
                          parametrageController.fecthFormat(widget.idService),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Format> formatList = snapshot.data!;
                          if (formatList.isNotEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(children: [
                                    const Text(
                                      "Format  : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    selectFormat != 0
                                        ? Text(
                                            "${formatF!.intitule!}",
                                          )
                                        : Text(
                                            "${impressionList[0].format?.intitule!}",
                                          )
                                  ]),
                                ),
                              ],
                            );
                          }
                        }
                        return Text("");
                      }),
                ),
                //Dimension
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  child: FutureBuilder(
                      future: parametrageController
                          .fecthDimension(widget.idService),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Dimension> dimensionList = snapshot.data!;
                          if (dimensionList.isNotEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(children: [
                                    const Text(
                                      "Dimension  : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    selectDimension != 0
                                        ? Text(
                                            "${dimensionF!.intitule!}",
                                          )
                                        : Text(
                                            "${impressionList[0].dimension?.intitule!}",
                                          )
                                  ]),
                                ),
                              ],
                            );
                          }
                        }
                        return Text("");
                      }),
                ),
                //Faces
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  child: FutureBuilder(
                      future:
                          parametrageController.fetchFaces(widget.idService),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Faces> facesList = snapshot.data!;
                          if (facesList.isNotEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(children: [
                                    const Text(
                                      "Faces : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    selectFace != 0
                                        ? Text(
                                            "${facesF!.intitule!}",
                                          )
                                        : Text(
                                            "${impressionList[0].faces?.intitule!}",
                                          )
                                  ]),
                                ),
                              ],
                            );
                          }
                        }
                        return Text("");
                      }),
                ),
                //Couleurs
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  child: FutureBuilder(
                      future:
                          parametrageController.fetchCouleur(widget.idService),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          List<Couleur> couleurList = snapshot.data!;
                          if (couleurList.isNotEmpty) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(children: [
                                    const Text(
                                      "Couleurs  : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    selectCouleur != 0
                                        ? Text(
                                            "${couleurF.intitule!}",
                                          )
                                        : Text(
                                            "${impressionList[0].couleur?.intitule!}",
                                          )
                                  ]),
                                ),
                              ],
                            );
                          }
                        }
                        return Text("");
                      }),
                ),

                const SizedBox(
                  height: 20,
                ),
                Text(
                  prixExemplaire == 0.0
                      ? '${prixStandardImpression} XAF'
                      : '${prixExemplaire} XAF',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Button(
                      label: "Payer",
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CinetPagePaiement(
                                    prixNetAPayer: prixStandard)));
                      },
                      backgroundColor: primary),
                )
              ],
            ),
          );
        });
    ;
  }
}
