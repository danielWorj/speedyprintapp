import 'package:flutter/material.dart';
import 'package:speedy/Controller/Service/Parametragecontroller.dart';
import 'package:speedy/Model/Service/Service.dart';
import 'package:speedy/Page/Commande/utils/description_widget.dart';
import 'package:speedy/Page/Commande/utils/divider_widget.dart';
import 'package:speedy/Page/Commande/utils/image_banner.dart';
import 'package:speedy/Page/Commande/utils/title_product_widget.dart';
import 'package:speedy/Page/Service/PageCommande.dart';
import 'package:speedy/Page/Service/utils/custom_icon_button.dart';
import 'package:speedy/Repository/Service/ParametrageRepoImpl.dart';
import 'package:speedy/color/color.dart';

class DetailService extends StatefulWidget {
  final Service service;
  const DetailService({super.key, required this.service});

  @override
  State<DetailService> createState() => _DetailServiceState();
}

class _DetailServiceState extends State<DetailService> {
  final paramettrageController = Parametragecontroller(ParametrageRepoImpl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: white,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Center(child: Text('${widget.service.intitule}')),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageBanner(imageUrl: "assets/${widget.service.image}"),
            const DividerWidget(),
            TitleProductWidget(name: widget.service.intitule!),
            //InfoProduct(localisation: widget.cartevisite.localisation!,entreprise: widget.cartevisite.entreprise!,fonction: widget.cartevisite.fonction! ),
            DescriptionWidget(
              text: widget.service.description!,
            ),

            CustomIconButton(
                label: "Commander",
                icon: Icon(Icons.shopping_cart),
                press: () {
                  print(
                      "Le service recherché est : ${widget.service.idServices}");

                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Container(
                              height: MediaQuery.sizeOf(context).height * 0.08,
                              width: MediaQuery.sizeOf(context).width,
                              padding: const EdgeInsets.all(02),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Pagecommande(
                                                            idService: widget
                                                                .service
                                                                .idServices!,
                                                            isupload: false,
                                                          )));
                                            },
                                            icon: const Icon(
                                              Icons.list_alt_sharp,
                                              color: primary,
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Pagecommande(
                                                            idService: widget
                                                                .service
                                                                .idServices!,
                                                            isupload: true,
                                                          )));
                                            },
                                            icon: Icon(
                                              Icons.upload,
                                              color: secondary,
                                            ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                                side: BorderSide(color: white)),
                          ));
                }),
          ],
        ),
      ),
    );
  }
}
