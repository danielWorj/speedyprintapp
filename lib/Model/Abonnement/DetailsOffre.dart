import 'Offre.dart';

class Detailsoffre {
  int? idDetailOffre;
  Offre? offre;
  String? intitule;

  Detailsoffre(this.idDetailOffre, this.offre, this.intitule);

  Detailsoffre.fromJson(Map<String, dynamic> json) {
    idDetailOffre = json['idDetailOffre'];
    offre = Offre.fromJson(json['offre']);
    intitule = json['intitule'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['idAbonnement'] = idDetailOffre.toString();
    data['offre'] = offre!.idOffre.toString();
    data['intitule'] = intitule;

    return data;
  }
}
