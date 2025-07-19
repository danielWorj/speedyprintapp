import 'package:speedy/Model/Client.dart';

class Rollup {
  int? idRollup;
  String? description;
  int? quantite;
  String? format;
  String? dateLivraison;
  Client? client;

  Rollup.formJson(Map<String, dynamic> json) {
    idRollup = json['idRollup'];
    description = json['description'];
    quantite = json['quantite'];
    format = json['format'];
    dateLivraison = json['dateLivraison'];
    client = Client.fromJson(json['client']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['idRollup'] = idRollup.toString();
    data['description'] = description;
    data['quantite'] = quantite;
    data['format'] = format;
    data['dateLivraison'] = dateLivraison;
    data['client'] = client!.idUser.toString();

    return data;
  }

  Rollup(this.idRollup, this.description, this.quantite, this.format,
      this.dateLivraison, this.client);
}
