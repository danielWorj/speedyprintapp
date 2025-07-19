import 'package:speedy/Model/Service/Service.dart';

class Dimension {
  int? idDimension;
  String? intitule;
  String? taille;
  Service? service;
  double? valeurAjout;
  double? valeurMultiplication;

  Dimension.fromJson(Map<String, dynamic> json) {
    idDimension = json['idDimension'];
    intitule = json['intitule'];
    taille = json['taille'];
    service = Service.fromJson(json['service']);
    valeurAjout = json['valeurAjout'] == null ? 0 : json['valeurAjout'];
    valeurMultiplication =
        json['valeurMultiplication'] == null ? 1 : json['valeurMultiplication'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['idDimension'] = idDimension.toString();
    data['intitule'] = intitule;
    data['taille'] = taille;
    data['service'] = service!.idServices.toString();
    data['valeurAjout'] = valeurAjout;
    data['valeurMultiplication'] = valeurMultiplication;

    return data;
  }

  Dimension(this.idDimension, this.intitule, this.taille, this.service,
      this.valeurAjout, this.valeurMultiplication);
}
