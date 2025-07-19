import 'package:flutter/material.dart';
import 'package:speedy/Model/Service/CategorieService.dart';
import 'package:speedy/Page/AboutUs.dart';
import 'package:speedy/Page/Chat/ChatPage.dart';
import 'package:speedy/Page/Profil.dart';
import 'package:speedy/Page/ServicePage.dart';
import 'package:speedy/color/color.dart';

import '../../Controller/Service/Parametragecontroller.dart';
import '../../Page/Abonnement.dart';
import '../../Repository/Service/ParametrageRepoImpl.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final parametrageController = Parametragecontroller(ParametrageRepoImpl());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              "Speedy Print",
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: const Text(
              "+237 678 89 09 87",
              style: TextStyle(color: Colors.black),
            ),
            decoration: BoxDecoration(
                color: primary,
                image: DecorationImage(
                    image: AssetImage("assets/explain.jpg"),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profil'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profil()));
            },
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard),
            title: Text('Abonnement'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Abonnement()));
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Chat'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ChatPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Annonces '),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.question_mark),
            title: Text('About Us'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs()));
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: const Text('Que cherchez Vous ?'),
          ),
          FutureBuilder<List<Categorieservice>>(
            future: parametrageController.fetchAllCategorieService(),
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
                    itemBuilder: ((context, index) {
                      final categorie = snapshot.data?[index];
                      return ListTile(
                        leading: Icon(Icons.list_sharp),
                        title: Text('${categorie!.intitule}'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Servicepage(
                                      idCategorie:
                                          categorie!.idCategorieService)));
                        },
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
        ],
      ),
    );
  }
}
