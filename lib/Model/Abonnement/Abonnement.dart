import 'package:speedy/Model/Client.dart';
import 'package:speedy/Repository/EndPoint/variable.dart';

import 'Offre.dart';

class Abonnement {
  int? idAbonnement;
  Client? client;
  Offre? offre;
  String? date;
  String? dateFin;

  Abonnement(
      this.idAbonnement, this.client, this.offre, this.date, this.dateFin);

  Abonnement.fromJson(Map<String, dynamic> json) {
    idAbonnement = json['idAbonnement'];
    client =
        json['client'] == null ? clientVar : Client.fromJson(json['client']);
    offre = json['offre'] == null ? offre : Offre.fromJson(json['offre']);
    date = json['date'];
    dateFin = json['dateFin'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['idAbonnement'] = idAbonnement.toString();
    data['client'] = client!.idUser.toString();
    data['offre'] = offre!.idOffre.toString();
    data['dateFin'] = dateFin;

    return data;
  }
}
