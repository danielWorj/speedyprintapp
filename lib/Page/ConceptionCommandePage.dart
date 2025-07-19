import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speedy/Controller/CommandeControllerInt.dart';
import 'package:speedy/DescriptionConceptionPage.dart';
import 'package:speedy/Model/Commande/ConceptionCommande.dart';
import 'package:speedy/Model/ServerResponse.dart';
import 'package:speedy/Repository/Commande/CommandeRepositoryImpl.dart';
import 'package:speedy/color/color.dart';
import 'package:speedy/component/utils/Button.dart';
import 'package:speedy/component/utils/CardOverLayImage.dart';

class ConceptionCommandePage extends StatefulWidget {
  const ConceptionCommandePage({super.key});

  @override
  State<ConceptionCommandePage> createState() => _ConceptionCommandePageState();
}

class _ConceptionCommandePageState extends State<ConceptionCommandePage> {
  final commandeController = Commandecontrollerint(Commanderepositoryimpl());
  final TextEditingController controller = TextEditingController();
  final TextEditingController description = TextEditingController();
  int idClient = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primary,
        title: Text(
          'Conception',
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
            child: FutureBuilder<List<ConceptionCommande>>(
              future: commandeController.fecthConceptionCommande(idClient),
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
                        final conceptionCommande = snapshot.data?[index];
                        return Cardoverlayimage(
                            titre:
                                "${conceptionCommande!.commande!.service!.intitule}",
                            subtitre: "${conceptionCommande!.date}",
                            onPress: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        icon: const Icon(
                                          Icons.check_box,
                                          color: primary,
                                        ),
                                        title: const Center(
                                            child:
                                                const Text("CHECK CONCEPTION")),
                                        content: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.25,
                                          padding: const EdgeInsets.all(02),
                                          child: Expanded(
                                            child: Column(
                                              children: [
                                                Button(
                                                    label:
                                                        "Lancer la production ",
                                                    press: () async {
                                                      ServerResponse
                                                          serverResponse =
                                                          await commandeController
                                                              .sendConceptionToProduction(
                                                                  conceptionCommande
                                                                      .commande!
                                                                      .idCommande!);

                                                      if (serverResponse!
                                                          .success!) {
                                                        Navigator.pop(context);
                                                        SnackBar snackbar =
                                                            SnackBar(
                                                          content: Text(
                                                              "Lancement de la production ...",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                          backgroundColor:
                                                              primary,
                                                        );

                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackbar);
                                                      } else {
                                                        SnackBar snackbar =
                                                            SnackBar(
                                                          content: Text(
                                                              "Echec du lacncement ...",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                          backgroundColor:
                                                              warning,
                                                        );

                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackbar);
                                                      }
                                                    },
                                                    backgroundColor: primary),
                                                Button(
                                                    label: "Modifier",
                                                    press: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  Descriptionconceptionpage(
                                                                    conceptionCommande:
                                                                        conceptionCommande,
                                                                  )));
                                                    },
                                                    backgroundColor:
                                                        Colors.grey),
                                              ],
                                            ),
                                          ),
                                        ),
                                        shape: const RoundedRectangleBorder(
                                            side: BorderSide(color: secondary)),
                                      ));
                            },
                            image: "assets/${conceptionCommande!.url}");
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
