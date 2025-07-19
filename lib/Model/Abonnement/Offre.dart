class Offre {
  int? idOffre;
  String? intitule;
  double? montant;
  double? remise;

  Offre.fromJson(Map<String, dynamic> json) {
    idOffre = json['idOffre'];
    intitule = json['intitule'];
    montant = json['montant'];
    remise = json['remise'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['idOffre'] = idOffre.toString();
    data['intitule'] = intitule.toString();
    data['montant'] = montant.toString();
    data['remise'] = remise.toString();

    return data;
  }

  Offre(this.idOffre, this.intitule, this.montant, this.remise);
}
