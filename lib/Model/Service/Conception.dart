import 'package:speedy/Model/Service/Service.dart';
import 'package:speedy/Model/Service/TypeConception.dart';

class Conception {
  int? idConception;
  double? montant;
  Service? service;
  TypeConception? typeConception;

  Conception(
      this.idConception, this.typeConception, this.montant, this.service);

  Conception.fromJson(Map<String, dynamic> json) {
    idConception = json['idConception'];
    typeConception = TypeConception.fromJson(json['typeConception']);
    montant = json['montant'];
    service = Service.fromJson(json['service']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['idConception'] = idConception.toString();
    data['typeConception'] = typeConception.toString();
    data['montant'] = montant;
    data['service'] = service!.idServices.toString();

    return data;
  }
}
