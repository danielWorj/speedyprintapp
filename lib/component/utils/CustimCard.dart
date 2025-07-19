import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../color/color.dart';

class CustomCard extends StatelessWidget {
  final String titre;
  final String textDescription;
  final String dateText;
  final String image;
  final VoidCallback onPress;
  final Icon? icon;
  final Color? color;

  const CustomCard(
      {super.key,
      required this.image,
      required this.titre,
      required this.textDescription,
      required this.dateText,
      required this.onPress,
      this.color,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.10,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: white,
            border: Border.all(color: const Color.fromARGB(255, 231, 231, 231)),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.1500,
                child: Image.asset(image),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      titre,
                      style: GoogleFonts.poppins(
                          fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      textDescription,
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: primary,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Text(
                          dateText,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: color == null
                                ? Color.fromARGB(255, 0, 136, 102)
                                : color,
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.07,
              //   width: MediaQuery.of(context).size.width * 0.09,
              //   child:
              //       //si l'icone est defini , on change , sinon on affiche l'cone par défaut
              //       Image.asset(
              //     icon.to,
              //     filterQuality: FilterQuality.high,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
