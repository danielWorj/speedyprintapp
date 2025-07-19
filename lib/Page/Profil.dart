import 'package:flutter/material.dart';
import 'package:speedy/Controller/ClientController.dart';
import 'package:speedy/Model/Client.dart';
import 'package:speedy/Repository/Client/ClientRepositoryImpl.dart';
import 'package:speedy/color/color.dart';
import 'package:speedy/component/utils/Button.dart';

import '../component/utils/TextField.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final clientController = Clientcontroller(ClientRepositoryImpl());

  //final dbLocal = Localstore.instance;
  TextEditingController nom = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController bankCard = TextEditingController();

  // Load and obtain the shared preferences for this app.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white54,
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const ListTile(
              leading: Icon(Icons.arrow_back),
              trailing: Icon(Icons.menu),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  maxRadius: 65,
                  backgroundImage: AssetImage("assets/profil.jpg"),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text("@jekfins")],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.4,
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(02),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InputField(
                        hintTxt: "Nom ",
                        icon: Icons.account_box_sharp,
                        controller: nom),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InputField(
                        hintTxt: "Telehone",
                        icon: Icons.phone,
                        controller: contact),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InputField(
                        hintTxt: "email", icon: Icons.email, controller: email),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Button(
                        label: "CREER",
                        press: () async {
                          //final prefs = await SharedPreferences.getInstance();

                          Client client = Client(1, nom.text, "", contact.text,
                              email.text, bankCard.text, true);

                          Client clientCreated =
                              await this.clientController.createAccount(client);

                          //await prefs.setInt('id', clientCreated.idUser!);
                        },
                        backgroundColor: primary),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
