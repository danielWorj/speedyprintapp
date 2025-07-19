import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:speedy/Page/ConceptionCommandePage.dart';
import 'package:speedy/Page/Home.dart';
import 'package:speedy/Page/LivraisonPage.dart';
import 'package:speedy/Page/Service/PageViewAllCommande.dart';
import 'package:speedy/Page/ServicePage.dart';

import '../color/color.dart';

class Rootpage extends StatefulWidget {
  const Rootpage({super.key});

  @override
  State<Rootpage> createState() => _RootpageState();
}

class _RootpageState extends State<Rootpage> {
  List<IconData> myIcon = [
    Icons.home,
    Icons.credit_card_outlined,
    Icons.delivery_dining,
    Icons.work,
  ];

  var indexOfPage = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: myIcon,
          iconSize: 32,
          activeColor: primary,
          splashColor: secondary,
          inactiveColor: black.withOpacity(0.5),
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 5,
          rightCornerRadius: 5,
          activeIndex: indexOfPage,
          onTap: (index) {
            setState(() {
              indexOfPage = index;
            });
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: primary,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.shopping_cart,
              size: 25,
              color: white,
            ),
          ),
          onPressed: () {
            setState(() {
              indexOfPage = 4;
            });
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: [
        const Home(),
        const PageViewAllCommande(),
        const LivraisonPage(),
        const ConceptionCommandePage(),
        const Servicepage(),
      ][indexOfPage],
    );
  }
}
