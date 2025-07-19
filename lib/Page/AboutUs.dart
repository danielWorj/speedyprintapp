import 'package:flutter/material.dart';
import 'package:speedy/Page/Commande/utils/description_widget.dart';
import 'package:speedy/Page/Commande/utils/image_banner.dart';
import 'package:speedy/Page/Service/utils/custom_icon_button.dart';
import 'package:speedy/color/color.dart';

import 'Service/utils/title_product_widget.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: white,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Center(child: Text('About Us ')),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageBanner(imageUrl: "assets/explain.jpg"),
            //const DividerWidget(),
            TitleProductWidget(name: "A propos de nous "),
            //InfoProduct(localisation: widget.cartevisite.localisation!,entreprise: widget.cartevisite.entreprise!,fonction: widget.cartevisite.fonction! ),
            DescriptionWidget(
                text:
                    "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Totam obcaecati laudantium quibusdam nostrum vero inventore. Error veniam quidem neque voluptatem eius delectus facere est, consequuntur temporibus amet alias obcaecati eos optio quia quasi incidunt quod odit officia sunt libero, quam voluptate impedit! Sapiente, ipsam quisquam. Veniam ullam distinctio ad id quisquam! Dolorum autem necessitatibus ipsa, officia, a itaque, veniam architecto dolorem harum consequuntur cum quae cumque quibusdam pariatur fugiat? Non pariatur in, ratione a at quia consequatur expedita porro tenetur? Facere inventore illum cupiditate fugit voluptate sed iusto similique consequuntur possimus doloremque dolorum ipsa aspernatur cum enim, id optio veniam!             "),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: primary,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('+237 696 64 92 33')
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Icon(
                    Icons.mail,
                    color: primary,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('speedy@gmail.com')
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CustomIconButton(
                label: "Appeler", icon: Icon(Icons.phone), press: () {}),
          ],
        ),
      ),
    );
  }
}
