import 'package:flutter/material.dart';
import 'package:speedy/color/color.dart';
import 'package:speedy/component/utils/Button.dart';

class Descriptionserviceuploadpage extends StatefulWidget {
  const Descriptionserviceuploadpage({super.key});

  @override
  State<Descriptionserviceuploadpage> createState() =>
      _DescriptionserviceuploadpageState();
}

class _DescriptionserviceuploadpageState
    extends State<Descriptionserviceuploadpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Importation",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: AlignmentDirectional.center,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Importer votre fichier ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Row(
                        children: [
                          //Les deux supports des icones
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                //SEND TO DATA BASE
                              },
                              child: const SizedBox(
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.upload,
                                      size: 30,
                                    ),
                                    Text("Upload")
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Button(
                  label: "V A L I D E R ",
                  press: () {},
                  backgroundColor: secondary),
            ),
          ],
        ),
      ),
    );
  }
}
