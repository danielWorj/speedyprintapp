import 'package:speedy/Model/Commande/Commande.dart';
import 'package:speedy/Repository/EndPoint/variable.dart';

class ConceptionCommande {
  int? idConception;
  String? date;
  String? url;
  Commande? commande;
  String? message;
  String? dateMisAJour;

  ConceptionCommande.fromJson(Map<String, dynamic> json) {
    idConception = json['idConception'];
    date = json['date'];
    url = json['url'];
    message = json['message'] ?? " ";
    message = json['message'];
    commande = json['commande'] == null
        ? commandeVar
        : Commande.fromJson(json['commande']);
  }

  ConceptionCommande(this.idConception, this.date, this.url, this.commande,
      this.message, this.dateMisAJour);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['idConception'] = idConception.toString();
    data['date'] = date;
    data['url'] = url;
    data['commande'] = commande!.idCommande.toString();
    data['message'] = message;
    data['dateMisAJour'] = dateMisAJour;
    return data;
  }
}
