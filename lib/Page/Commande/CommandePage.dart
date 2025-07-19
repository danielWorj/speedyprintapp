import 'package:flutter/material.dart';
import 'package:speedy/Page/Commande/CarteCommande.dart';
import 'package:speedy/Page/Commande/FlyerCommande.dart';
import 'package:speedy/Page/Commande/OtherCommande.dart';
import 'package:speedy/Page/Templates/RolllUpPage.dart';

import '../../color/color.dart';

class CommandePage extends StatefulWidget {
  const CommandePage({super.key});

  @override
  State<CommandePage> createState() => _CommandePageState();
}

class _CommandePageState extends State<CommandePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: AppBar(
              centerTitle: true,
              bottom: const TabBar(
                  labelColor: primary,
                  labelPadding: EdgeInsets.symmetric(horizontal: 15),
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: secondary,
                  tabs: [
                    Tab(
                      text: "Cartes V.",
                    ),
                    Tab(
                      text: "Flyers",
                    ),
                    Tab(
                      text: "Roll Up",
                    ),
                    Tab(
                      text: "Others",
                    )
                  ]),
              title: const Text('Commande',
                  style: TextStyle(
                      color: primary,
                      fontSize: 32,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          body: const TabBarView(children: [
            CarteCommandePage(),
            FlyerCommandePage(),
            RollUpPage(),
            OtherCommande()
          ]),
        ));
  }
}
