import 'package:speedy/Model/Service/Service.dart';
import 'package:speedy/Repository/EndPoint/variable.dart';

class TypePapier {
  int? idTypePapier;
  String? intitule;
  Service? service;
  double? valeurAjout;
  double? valeurMultiplication;

  TypePapier(this.idTypePapier, this.intitule, this.service, this.valeurAjout,
      this.valeurMultiplication);

  TypePapier.fromJson(Map<String, dynamic> json) {
    idTypePapier = json['idTypePapier'];
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

    data['idTypePapier'] = idTypePapier.toString();
    data['intitule'] = intitule;
    data['service'] = service!.idServices.toString();
    data['valeurAjout'] = valeurAjout;
    data['valeurMultiplication'] = valeurMultiplication;

    return data;
  }
}
