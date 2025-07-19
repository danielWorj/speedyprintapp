import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speedy/Controller/CommandeControllerInt.dart';
import 'package:speedy/Model/Service/Livraison.dart';
import 'package:speedy/Repository/Commande/CommandeRepositoryImpl.dart';
import 'package:speedy/color/color.dart';
import 'package:speedy/component/utils/CustimCard.dart';

class LivraisonPage extends StatefulWidget {
  const LivraisonPage({super.key});

  @override
  State<LivraisonPage> createState() => _LivraisonPageState();
}

class _LivraisonPageState extends State<LivraisonPage> {
  final commandeController = Commandecontrollerint(Commanderepositoryimpl());

  int idClient = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primary,
        title: Text(
          'Livraison',
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Expanded(
        child: FutureBuilder<List<Livraison>>(
          future: commandeController.fetchLivraisonByClient(idClient),
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
              return Container(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      final livraison = snapshot.data?[index];
                      return CustomCard(
                          image: "assets/livraisonb.png",
                          titre:
                              "${livraison!.commande!.service != null ? livraison!.commande!.service!.intitule : 'ERROR'}",
                          textDescription:
                              'Creation : ${livraison!.commande!.dateCreation}',
                          dateText:
                              'Livraison : ${livraison!.commande!.dateLivraison}',
                          onPress: () {});
                    }),
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 0.2,
                        height: 0.3,
                      );
                    },
                    itemCount: snapshot.data?.length ?? 0),
              );
            }
            return Text("******Application Failed *******");
          }),
        ),
      ),
    );
  }
}
