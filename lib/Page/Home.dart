import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speedy/Page/Templates/Template.dart';
import 'package:speedy/color/color.dart';
import 'package:speedy/component/utils/Baniere.dart';
import 'package:speedy/component/utils/CardHome.dart';
import 'package:speedy/component/utils/Navbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final urlImages = [
    "cartes.jpg",
    "roll.jpg",
    "photo.jpg",
    "flyers.jpg",
  ];

  final slideController = CarouselSliderController();
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: null,
          title: Row(
            children: [
              Image.asset("assets/logo.jpg", width: 50, height: 50),
              const Column(
                children: [
                  Text(
                    'Speedy Print',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "La distance n'existe plus.",
                    style: TextStyle(fontSize: 8),
                  ),
                ],
              )
            ],
          )

          // brightness: Brightness.light,
          ),
      endDrawer: Navbar(), //Nabar right
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Baniere(
                image: "photo.jpg",
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Nos Réalisations",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  GestureDetector(
                    child: const Text("Tout Voir"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TemplatePage()));
                    },
                  )
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.4,
                child: CarouselSlider.builder(
                  carouselController: slideController,
                  itemCount: urlImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage_ = urlImages[index];
                    return buildImage(urlImage_, index, context);
                  },
                  options: CarouselOptions(
                    height: 400,
                    autoPlay: true,
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration: Duration(seconds: 2),
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) => setState(() {
                      activeIndex = index;
                    }),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "En Promo",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                  ),
                  Text("Tout Voir")
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(width: 05),
                  Expanded(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Row(children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              width: MediaQuery.of(context).size.width * 0.4500,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  border: Border.all(color: Colors.black12)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(05),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1000,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.500,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                  "assets/roll.jpg",
                                                ),
                                                filterQuality:
                                                    FilterQuality.high,
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01800,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2500,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Roll Up",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: primary),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Text(
                                        "2000 XAF",
                                        style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 05),
                                      child: Text(
                                        "En promo",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: secondary,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ]),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              width: MediaQuery.of(context).size.width * 0.4500,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  border: Border.all(color: Colors.black12)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(05),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1000,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.500,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                  "assets/flyers.jpg",
                                                ),
                                                filterQuality:
                                                    FilterQuality.high,
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01800,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2500,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Flyers",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: primary),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Text(
                                        "2000 XAF",
                                        style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 05),
                                      child: Text(
                                        "En promo",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: secondary,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ]),
                            ),
                          ])))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Offres",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Cardhome(
                    title: "Remise \n Exceptionnelle",
                    description: " ",
                    image: "assets/remiseb.png",
                    press: () {},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Cardhome(
                    title: "Livraison \n Express ",
                    description: " ",
                    image: "assets/livraisonb.png",
                    press: () {},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Cardhome(
                    title: "Assistance \n Telephonique",
                    description: " ",
                    image: "assets/appelb.png",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildImage(String urlImage, int index, BuildContext context) =>
    Container(
        child: GestureDetector(
            onTap: () {
              /*Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CustomPDFViewer(
                          titrePDF: urlImage, lien: urlImageToPDFFinal)));**/
              print(urlImage);
            },
            child: Image.asset("assets/$urlImage", fit: BoxFit.cover)));
