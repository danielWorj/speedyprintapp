import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speedy/Controller/CommandeControllerInt.dart';
import 'package:speedy/Controller/Service/Parametragecontroller.dart';
import 'package:speedy/Model/Service/CategorieService.dart';
import 'package:speedy/Page/ServicePage.dart';
import 'package:speedy/Repository/Commande/CommandeRepositoryImpl.dart';
import 'package:speedy/Repository/Service/ParametrageRepoImpl.dart';
import 'package:speedy/color/color.dart';

class CategorieServicePage extends StatefulWidget {
  const CategorieServicePage({super.key});

  @override
  State<CategorieServicePage> createState() => _CategorieServicePageState();
}

class _CategorieServicePageState extends State<CategorieServicePage> {
  final parametrageController = Parametragecontroller(ParametrageRepoImpl());

  TextEditingController contact = TextEditingController();
  TextEditingController email = TextEditingController();

  int selectedService = -1;

  final commandeController = Commandecontrollerint(Commanderepositoryimpl());

  int idClient = 3;

  @override
  Widget build(BuildContext context) {
    //le bon code est dans les commentaires
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primary,
        title: Text(
          'Categorie Service',
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<List<Categorieservice>>(
          future: parametrageController.fetchAllCategorieService(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: secondary,
                ),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Uner erreur est survenue"),
              );
            }
            if (snapshot.hasData) {
              print("data");
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5000,
                        child: serviceContainer(snapshot.data![index], index));
                  });
            }
            return Text("******Application Failed *******");
          }),
        ),
      ),
    );
  }

  serviceContainer(Categorieservice? service, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedService == index)
            selectedService = -1;
          else
            selectedService = index;
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Servicepage()));
      },
      child: AnimatedContainer(
        //ca c'est pour l'apparution du cadre bleau sur le service
        duration: Duration(milliseconds: 100),
        padding: EdgeInsets.all(20.0),

        decoration: BoxDecoration(
          color: selectedService == index
              ? Colors.blue.shade50
              : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index
                ? Colors.blue
                : Colors.blue.withOpacity(0),
            width: 2.0,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset("assets/${service!.image}", height: 80),
          const SizedBox(
            height: 20,
          ),
          Text(
            service!.intitule!,
            style: TextStyle(fontSize: 20),
          ),
        ]),
      ),
    );
  }
}
