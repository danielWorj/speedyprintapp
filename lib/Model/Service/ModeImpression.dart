import 'package:speedy/Model/Service/Service.dart';

class ModeImpression {
  int? idModeImpression;
  String? intitule;
  String? description;
  Service? service;
  double? valeurAjout;
  double? valeurMultiplication;

  ModeImpression(this.idModeImpression, this.intitule, this.description,
      this.service, this.valeurAjout, this.valeurMultiplication);

  ModeImpression.fromJson(Map<String, dynamic> json) {
    idModeImpression = json['idModeImpression'];
    intitule = json['intitule'];
    description = json['description'];
    service = Service.fromJson(json['service']);
    valeurAjout = json['valeurAjout'] == null ? 0 : json['valeurAjout'];
    valeurMultiplication =
        json['valeurMultiplication'] == null ? 1 : json['valeurMultiplication'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['idModeImpression'] = idModeImpression.toString();
    data['intitule'] = intitule;
    data['description'] = description;
    data['service'] = service!.idServices.toString();
    data['valeurAjout'] = valeurAjout;
    data['valeurMultiplication'] = valeurMultiplication;

    return data;
  }
}
