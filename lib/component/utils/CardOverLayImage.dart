import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../color/color.dart';

class Cardoverlayimage extends StatelessWidget {
  final String titre;
  final String subtitre;
  final String image;
  final VoidCallback onPress;

  const Cardoverlayimage(
      {super.key,
      required this.titre,
      required this.subtitre,
      required this.onPress,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(05),
        height: MediaQuery.of(context).size.height * 0.30,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            border: Border.all(color: Colors.black12)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  image: DecorationImage(
                      image: AssetImage("$image"),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(
                width: 05,
              ),
              Text(
                "$titre",
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w500, color: primary),
              ),
            ]),
          ),
          const SizedBox(
            height: 03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(
                width: 05,
              ),
              Text(
                "$subtitre",
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: secondary),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
