import 'package:flutter/material.dart';
import 'package:speedy/Page/Templates/CartesVisitePage.dart';
import 'package:speedy/Page/Templates/FlyersPage.dart';
import 'package:speedy/Page/Templates/RolllUpPage.dart';

import '../../color/color.dart';

class TemplatePage extends StatefulWidget {
  //Cette page a été mis à jour pour etre lapage de présentation des realisation
  const TemplatePage({super.key});

  @override
  State<TemplatePage> createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
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
                      text: "Cartes Visite",
                    ),
                    Tab(
                      text: "Flyers",
                    ),
                    Tab(
                      text: "Roll Up",
                    )
                  ]),
              title: const Text('Nos Realisations',
                  style: TextStyle(
                      color: primary,
                      fontSize: 32,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          body: const TabBarView(
              children: [Cartesvisitepage(), FlyesPage(), RollUpPage()]),
        ));
  }
}
