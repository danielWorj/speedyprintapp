import 'package:speedy/Model/Service/Couleur.dart';
import 'package:speedy/Model/Service/Dimension.dart';
import 'package:speedy/Model/Service/Faces.dart';
import 'package:speedy/Model/Service/Finition.dart';
import 'package:speedy/Model/Service/Format.dart';
import 'package:speedy/Model/Service/Forme.dart';
import 'package:speedy/Model/Service/Grammage.dart';
import 'package:speedy/Model/Service/ModeImpression.dart';
import 'package:speedy/Model/Service/Service.dart';
import 'package:speedy/Model/Service/TypePapier.dart';
import 'package:speedy/Repository/EndPoint/variable.dart';

class Impression {
  int? idImpression;
  int? quantite;
  double? remise;
  double? montant;
  Service? service;
  int? borneInferieure;
  int? borneSuperieure;

  ModeImpression? modeImpression;
  Dimension? dimension;
  Format? format;
  TypePapier? typePapier;
  Faces? faces;
  Grammage? grammage;
  Finition? finition;
  Forme? forme;
  Couleur? couleur;

  Impression(
      this.idImpression,
      this.quantite,
      this.remise,
      this.montant,
      this.service,
      this.modeImpression,
      this.dimension,
      this.format,
      this.typePapier,
      this.faces,
      this.grammage,
      this.finition,
      this.forme,
      this.couleur,
      this.borneInferieure,
      this.borneSuperieure);

  Impression.fromJson(Map<String, dynamic> json) {
    idImpression = json['idImpression'];
    quantite = json['quantite'];
    remise = json['remise'];
    montant = json['montant'];
    borneInferieure =
        json['borneInferieure'] == null ? 0 : json['borneInferieure'];
    borneSuperieure =
        json['borneSuperieure'] == null ? 0 : json['borneSuperieure'];
    service = Service.fromJson(json['service']);
    typePapier = json['typePapier'] == null
        ? typePapierVar
        : TypePapier.fromJson(json['typePapier']);
    faces = json['faces'] == null ? facesVar : Faces.fromJson(json['faces']);
    grammage = json['grammage'] == null
        ? grammageVar
        : Grammage.fromJson(json['grammage']);
    finition = json['finition'] == null
        ? finitionVar
        : Finition.fromJson(json['finition']);
    finition = json['finition'] == null
        ? finitionVar
        : Finition.fromJson(json['finition']);
    forme = json['forme'] == null ? formesVar : Forme.fromJson(json['forme']);
    couleur = json['couleur'] == null
        ? couleurVar
        : Couleur.fromJson(json['couleur']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['idImpression'] = idImpression.toString();
    data['quantite'] = quantite;
    data['remise'] = remise;
    data['montant'] = montant;
    data['borneInferieure'] = borneInferieure;
    data['borneSuperieure'] = borneSuperieure;
    data['service'] = service!.idServices.toString();
    data['modeImpression'] = modeImpression!.idModeImpression.toString();
    data['dimension'] = dimension!.idDimension.toString();
    data['format'] = format!.idFormat.toString();
    data['typePapier'] = typePapier!.idTypePapier.toString();
    data['faces'] = faces!.idFaces.toString();
    data['finition'] = finition!.idFinition.toString();
    data['forme'] = forme!.idForme.toString();
    data['couleur'] = couleur!.idCouleur.toString();

    return data;
  }
}
