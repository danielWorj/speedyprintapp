import 'package:speedy/Model/Commande/Commande.dart';
import 'package:speedy/Repository/EndPoint/variable.dart';

class Livraison {
  int? idLivraison;
  String? destination;
  Commande? commande;
  String? localDate;
  bool? etat;

  Livraison(this.idLivraison, this.destination, this.commande, this.localDate,
      this.etat);

  Livraison.fromJson(Map<String, dynamic> json) {
    idLivraison = json['idLivraison'];
    destination = json['destination'];
    commande = json['commande'] == null
        ? commandeVar
        : Commande.fromJson(json['commande']);
    localDate = json['localDate'] ?? '24-04-2025';
    etat = json['etat'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['idLivraison'] = idLivraison.toString();
    data['destination'] = destination;
    data['commande'] = commande!.idCommande.toString();
    data['localDate'] = destination;
    data['etat'] = etat.toString();

    return data;
  }
}
