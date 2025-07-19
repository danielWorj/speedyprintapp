import 'package:speedy/Model/Client.dart';

class Cartevisite {
  int? idCarteVisite;
  String? nomPrenom;
  String? entreprise;
  String? fonction;
  String? localisation;
  String? description;
  int? quantite;
  String? plastification;
  String? decoupe;
  String? dateLivraison;
  String? image;
  Client? client;

  Cartevisite(
      this.idCarteVisite,
      this.nomPrenom,
      this.entreprise,
      this.fonction,
      this.localisation,
      this.description,
      this.quantite,
      this.plastification,
      this.decoupe,
      this.dateLivraison,
      this.image,
      this.client);

  Cartevisite.fromJson(Map<String, dynamic> json) {
    idCarteVisite = json['idCarteVisite'];
    nomPrenom = json['nomPrenom'];
    entreprise = json['entreprise'];
    fonction = json['fonction'];
    localisation = json['localisation'];
    description = json['description'];
    quantite = json['quantite'];
    plastification = json['plastification'];
    decoupe = json['decoupe'];
    decoupe = json['dateLivraison'];
    image = json['image'];
    client = Client.fromJson(json['client']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['idCarteVisite'] = idCarteVisite.toString();
    data['nomPrenom'] = nomPrenom;
    data['entreprise'] = entreprise;
    data['fonction'] = fonction;
    data['localisation'] = localisation;
    data['description'] = description;
    data['quantite'] = quantite.toString();
    data['plastification'] = plastification;
    data['decoupe'] = decoupe;
    data['dateLivraison'] = dateLivraison;
    data['image'] = image;
    data['client'] = client?.idUser.toString();

    return data;
  }
}
