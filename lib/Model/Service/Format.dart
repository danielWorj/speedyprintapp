import 'package:speedy/Model/Service/Service.dart';

class Format {
  int? idFormat;
  String? intitule;
  Service? service;
  double? valeurAjout;
  double? valeurMultiplication;

  Format(this.idFormat, this.intitule, this.service, this.valeurAjout,
      this.valeurMultiplication);

  Format.fromJson(Map<String, dynamic> json) {
    idFormat = json['idFormat'];
    intitule = json['intitule'];
    service = Service.fromJson(json['service']);
    valeurAjout = json['valeurAjout'] == null ? 0 : json['valeurAjout'];
    valeurMultiplication =
        json['valeurMultiplication'] == null ? 1 : json['valeurMultiplication'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['idFormat'] = idFormat.toString();
    data['intitule'] = intitule;
    data['service'] = service!.idServices.toString();
    data['valeurAjout'] = valeurAjout;
    data['valeurMultiplication'] = valeurMultiplication;

    return data;
  }
}
