import 'package:speedy/Model/Service/Service.dart';
import 'package:speedy/Repository/EndPoint/variable.dart';

class Grammage {
  int? idGrammage;
  String? intitule;
  Service? service;
  double? valeurAjout;
  double? valeurMultiplication;

  Grammage(this.idGrammage, this.intitule, this.service, this.valeurAjout,
      this.valeurMultiplication);

  Grammage.fromJson(Map<String, dynamic> json) {
    idGrammage = json['idGrammage'];
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

    data['idGrammage'] = idGrammage.toString();
    data['intitule'] = intitule;
    data['service'] = service!.idServices.toString();
    data['valeurAjout'] = valeurAjout;
    data['valeurMultiplication'] = valeurMultiplication;

    return data;
  }
}
