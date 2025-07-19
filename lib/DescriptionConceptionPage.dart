import 'package:flutter/material.dart';
import 'package:speedy/Controller/CommandeControllerInt.dart';
import 'package:speedy/Model/Commande/ConceptionCommande.dart';
import 'package:speedy/Repository/Commande/CommandeRepositoryImpl.dart';
import 'package:speedy/color/color.dart';
import 'package:speedy/component/utils/TextArea.dart';

import 'Page/Service/utils/custom_icon_button.dart';

class Descriptionconceptionpage extends StatefulWidget {
  final ConceptionCommande conceptionCommande;
  const Descriptionconceptionpage(
      {super.key, required this.conceptionCommande});

  @override
  State<Descriptionconceptionpage> createState() =>
      _DescriptionconceptionpageState();
}

class _DescriptionconceptionpageState extends State<Descriptionconceptionpage> {
  final commandeController = Commandecontrollerint(Commanderepositoryimpl());

  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Avis',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/${widget.conceptionCommande!.url}'),
            const SizedBox(height: 20),
            const Text(
              "Un avis sur la conception?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextAreaCustom(
                icon: Icons.list_alt_outlined,
                color: Colors.black,
                controller: description,
                pressIcon: () {},
              ),
            ),
            const SizedBox(height: 20),
            CustomIconButton(
                label: "Déposer cet Avis",
                icon: Icon(Icons.edit),
                press: () async {
                  ConceptionCommande conception = ConceptionCommande(
                      widget.conceptionCommande!.idConception,
                      "date",
                      "url",
                      widget.conceptionCommande!.commande!,
                      description.text,
                      "dateMisAJour");

                  bool isSuccess = await commandeController
                      .createAvisConceptionCommande(conception);

                  if (isSuccess) {
                    SnackBar snackbar = SnackBar(
                      content: Text("Votre avis a bien été envoyé",
                          style: TextStyle(color: Colors.white)),
                      backgroundColor: primary,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  } else {
                    SnackBar snackbar = SnackBar(
                      content: Text("Une erreur est survenue",
                          style: TextStyle(color: Colors.white)),
                      backgroundColor: warning,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
