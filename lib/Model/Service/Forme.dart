import 'package:speedy/Model/Service/Service.dart';
import 'package:speedy/Repository/EndPoint/variable.dart';

class Forme {
  int? idForme;
  String? intitule;
  Service? service;
  double? valeurAjout;
  double? valeurMultiplication;

  Forme(this.idForme, this.intitule, this.service, this.valeurAjout,
      this.valeurMultiplication);

  Forme.fromJson(Map<String, dynamic> json) {
    idForme = json['idForme'];
    intitule = json['intitule'];
    service = json['service '] == null
        ? serviceVar
        : Service.fromJson(json['service']);
    valeurAjout = json['valeurAjout'] == null ? 0 : json['valeurAjout'];
    valeurMultiplication =
        json['valeurMultiplication'] == null ? 1 : json['valeurMultiplication'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['idForme'] = idForme.toString();
    data['intitule'] = intitule;
    data['service'] = service!.idServices.toString();
    data['valeurAjout'] = valeurAjout;
    data['valeurMultiplication'] = valeurMultiplication;

    return data;
  }
}
