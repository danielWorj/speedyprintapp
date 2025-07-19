import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speedy/Controller/CommandeControllerInt.dart';
import 'package:speedy/Model/Commande/Commande.dart';
import 'package:speedy/Repository/Commande/CommandeRepositoryImpl.dart';
import 'package:speedy/color/color.dart';
import 'package:speedy/component/utils/CustimCard.dart';

class PageViewAllCommande extends StatefulWidget {
  const PageViewAllCommande({super.key});

  @override
  State<PageViewAllCommande> createState() => _PageViewAllCommandeState();
}

class _PageViewAllCommandeState extends State<PageViewAllCommande> {
  final commandeController = Commandecontrollerint(Commanderepositoryimpl());

  int idClient = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primary,
        title: Text(
          'Commande',
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Commande>>(
              future: commandeController.findCommandeByClient(idClient),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: primary,
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Uner erreur est survenue"),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        final commande = snapshot.data?[index];
                        return CustomCard(
                            image: "assets/commandep.png",
                            titre:
                                "${commande!.service != null ? commande!.service!.intitule : 'ERROR'}",
                            textDescription: commande.etatCommande != null
                                ? '${commande.etatCommande!.intitule}'
                                : 'ANALYSE',
                            dateText: 'Livraison : ${commande.dateLivraison}',
                            onPress: () {});
                      }),
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 0.2,
                          height: 0.3,
                        );
                      },
                      itemCount: snapshot.data?.length ?? 0);
                }
                return Text("******Application Failed *******");
              }),
            ),
          ),
        ],
      ),
    );
  }
}
