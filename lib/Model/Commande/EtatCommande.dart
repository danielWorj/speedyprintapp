class EtatCommande {
  int? idEtatCommande;
  String? intitule;

  EtatCommande(this.idEtatCommande, this.intitule);

  EtatCommande.fromJson(Map<String, dynamic> json) {
    idEtatCommande = json['idEtatCommande'];
    intitule = json['intitule'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['idEtatCommande'] = idEtatCommande.toString();
    data['intitule'] = intitule;

    return data;
  }
}
