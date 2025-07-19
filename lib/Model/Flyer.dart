import 'package:speedy/Model/Client.dart';

class Flyer {
  int? idFlyer;
  String? description;
  int? quantite;
  String? peliculage;
  String? dimension;
  String? dateLivraison;
  Client? client;

  Flyer.fromJson(Map<String, dynamic> json) {
    idFlyer = json['idFlyer'];
    description = json['description'];
    quantite = json['quantite'];
    peliculage = json['peliculage'];
    dimension = json['dimension'];
    dateLivraison = json['dateLivraison'];
    client = Client.fromJson(json['dateLivraison']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['idFlyer'] = idFlyer.toString();
    data['description'] = description;
    data['quantite'] = quantite.toString();
    data['peliculage'] = peliculage;
    data['dimension'] = dimension;
    data['dateLivraison'] = dateLivraison;
    data['client'] = client!.idUser.toString();
    return data;
  }

  Flyer(this.idFlyer, this.description, this.quantite, this.peliculage,
      this.dimension, this.dateLivraison, this.client);
}
