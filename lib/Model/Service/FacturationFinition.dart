import 'package:speedy/Model/Service/Finition.dart';
import 'package:speedy/Repository/EndPoint/variable.dart';

class Facturationfinition {
  int? idFacturationFinition;
  Finition? finition;
  double? valeurAjout;
  double? valeurMultiplication;
  int? borneInferieure;
  int? borneSuperieure;

  Facturationfinition(
      this.idFacturationFinition,
      this.finition,
      this.valeurAjout,
      this.valeurMultiplication,
      this.borneInferieure,
      this.borneSuperieure);

  Facturationfinition.fromJson(Map<String, dynamic> json) {
    idFacturationFinition = json['idFacturationFinition'];
    finition = json['finition '] == null
        ? finitionVar
        : Finition.fromJson(json['finition']);

    valeurAjout = json['valeurAjout'] == null ? 0 : json['valeurAjout'];
    valeurMultiplication =
        json['valeurMultiplication'] == null ? 1 : json['valeurMultiplication'];

    borneInferieure =
        json['borneInferieure'] == null ? 1 : json['borneInferieure'];
    borneSuperieure =
        json['borneSuperieure'] == null ? 1 : json['borneSuperieure'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['idFacturationFinition'] = idFacturationFinition.toString();
    data['valeurAjout'] = valeurAjout;
    data['finition'] = finition!.idFinition.toString();
    data['valeurMultiplication'] = valeurMultiplication;
    data['borneInferieure'] = borneInferieure;
    data['borneSuperieure'] = borneSuperieure;

    return data;
  }
}
