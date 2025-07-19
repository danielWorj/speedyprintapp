import 'package:speedy/Model/Commande/Commande.dart';

class ImageCommande {
  int? idImage;
  String? url;
  Commande? commande;

  ImageCommande(this.idImage, this.url, this.commande);

  ImageCommande.fromJson(Map<String, dynamic> json) {
    idImage = json['idImage'];
    url = json['url'];
    commande = Commande.fromJson(json['commande']);
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['idImage'] = idImage.toString();
    data['url'] = url;
    data['commande'] = commande!.idCommande.toString();

    return data;
  }
}
