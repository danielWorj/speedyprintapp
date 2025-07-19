import 'package:speedy/Model/Client.dart';
import 'package:speedy/Model/Commande/EtatCommande.dart';
import 'package:speedy/Model/Service/Conception.dart';
import 'package:speedy/Model/Service/Couleur.dart';
import 'package:speedy/Model/Service/Dimension.dart';
import 'package:speedy/Model/Service/Faces.dart';
import 'package:speedy/Model/Service/Finition.dart';
import 'package:speedy/Model/Service/Format.dart';
import 'package:speedy/Model/Service/Forme.dart';
import 'package:speedy/Model/Service/Grammage.dart';
import 'package:speedy/Model/Service/Impression.dart';
import 'package:speedy/Model/Service/ModeImpression.dart';
import 'package:speedy/Model/Service/Service.dart';
import 'package:speedy/Model/Service/TypePapier.dart';
import 'package:speedy/Repository/EndPoint/variable.dart';

class Commande {
  int? idCommande;
  int? quantite;
  String? dateLivraison;
  String? dateCreation;
  bool? origin;
  String? description;
  Service? service;
  Client? client;
  EtatCommande? etatCommande;

  Conception? conception;
  Impression? impression;

  ModeImpression? modeImpression;
  Dimension? dimension;
  Format? format;
  TypePapier? typePapier;
  Faces? faces; //////
  Grammage? grammage;
  Finition? finition;
  Forme? forme;
  Couleur? couleur; ////

  Commande(
      this.idCommande,
      this.quantite,
      this.dateLivraison,
      this.dateCreation,
      this.origin,
      this.description,
      this.service,
      this.client,
      this.etatCommande,
      this.modeImpression,
      this.dimension,
      this.format,
      this.conception,
      this.impression,
      this.typePapier,
      this.faces,
      this.grammage,
      this.finition,
      this.forme,
      this.couleur);

  Commande.fromJson(Map<String, dynamic> json) {
    idCommande = json['idCommande'];
    quantite = json['quantite'];
    dateLivraison = json['dateLivraison'];
    dateCreation = json['dateCreation'];
    origin = json['origin'];
    description = json['description'];

    service = json['service'] == null
        ? serviceVar
        : Service.fromJson(json['service']);
    client =
        json['client'] == null ? clientVar : Client.fromJson(json['client']);
    etatCommande = json['etatCommande'] == null
        ? etatCommandeVar
        : EtatCommande.fromJson(json['etatCommande']);
    modeImpression = json['modeImpression'] == null
        ? modeImpression
        : ModeImpression.fromJson(json['modeImpression']);
    dimension = json['dimension'] == null
        ? dimensionVar
        : Dimension.fromJson(json['dimension']);
    format =
        json['format'] == null ? formatVar : Format.fromJson(json['format']);

    conception = json['conception'] == null
        ? conceptionVar
        : Conception.fromJson(json['conception']);

    impression = json['impression'] == null
        ? impressionVar
        : Impression.fromJson(json['impression']);
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

    data['idCommande'] = idCommande.toString();
    data['quantite'] = quantite.toString();
    data['dateLivraison'] = dateLivraison;
    data['dateCreation'] = dateCreation;
    data['origin'] = origin.toString();
    data['description'] = description;
    data['service'] = service!.idServices.toString();
    data['client'] = client!.idUser.toString();
    data['etatCommande'] = etatCommande!.idEtatCommande.toString();
    data['modeImpression'] = modeImpression!.idModeImpression.toString();
    data['dimension'] = dimension!.idDimension.toString();
    data['format'] = format!.idFormat.toString();
    data['conception'] = conception!.idConception.toString();
    data['impression'] = impression!.idImpression.toString();
    data['typePapier'] = typePapier!.idTypePapier.toString();
    data['faces'] = faces!.idFaces.toString();
    data['finition'] = finition!.idFinition.toString();
    data['forme'] = forme!.idForme.toString();
    data['couleur'] = couleur!.idCouleur.toString();

    return data;
  }
}
