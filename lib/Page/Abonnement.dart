import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speedy/Controller/Abonnement/AbonnementController.dart';
import 'package:speedy/Model/Abonnement/Offre.dart';
import 'package:speedy/color/color.dart';
import 'package:speedy/component/utils/AbonnementCard.dart';

import '../Repository/Abonnement/OffreRepositoryImpl.dart';
import 'Paiement/CinetPage.dart';

class Abonnement extends StatefulWidget {
  const Abonnement({super.key});

  @override
  State<Abonnement> createState() => _AbonnementState();
}

class _AbonnementState extends State<Abonnement> {
  final offreController = OffreController(OffrerepositoryImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primary,
        title: Text(
          'Abonnement',
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Expanded(
        child: FutureBuilder<List<Offre>>(
          future: offreController.fecthAllOffre(),
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
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: ((context, index) {
                    final offre = snapshot.data?[index];
                    print(offre!.intitule!);
                    return Card(
                      shadowColor: primary,
                      child: AbonnementCard(
                        title: '${offre!.intitule}',
                        subTitle: '${offre!.montant} Remise : ${offre!.remise}',
                        button: FilledButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CinetPagePaiement(
                                          prixNetAPayer: offre.montant!)));
                            },
                            child: const Text('Souscrire')),
                      ),
                    );
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
    );
  }
}
