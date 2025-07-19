import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:speedy/Model/Service/CategorieService.dart';
import 'package:speedy/Model/Service/Conception.dart';
import 'package:speedy/Model/Service/Couleur.dart';
import 'package:speedy/Model/Service/Dimension.dart';
import 'package:speedy/Model/Service/Faces.dart';
import 'package:speedy/Model/Service/FacturationFinition.dart';
import 'package:speedy/Model/Service/Finition.dart';
import 'package:speedy/Model/Service/Format.dart';
import 'package:speedy/Model/Service/Forme.dart';
import 'package:speedy/Model/Service/Grammage.dart';
import 'package:speedy/Model/Service/Impression.dart';
import 'package:speedy/Model/Service/ModeImpression.dart';
import 'package:speedy/Model/Service/Service.dart';
import 'package:speedy/Model/Service/TypePapier.dart';
import 'package:speedy/Repository/EndPoint/EndPoint.dart';
import 'package:speedy/Repository/Service/ParametrageRepoInt.dart';

class ParametrageRepoImpl implements ParametrageRepoInt {
  @override
  Future<List<Service>> listService() async {
    print("In Repo service");

    // TODO: implement listService
    List<Service> allService = [];

    final uri = Uri.parse("$urlParametrage/service/all");

    final resp = await http.get(uri); //await data

    final respBody = json.decode(resp.body); // json data

    for (var i = 0; i < respBody.length; i++) {
      var serviceInstance = respBody[i];
      allService.add(Service.fromJson(serviceInstance));
    }

    return allService;
  }

  @override
  Future<List<Dimension>> listDimensionByService(int idService) async {
    print("list dilension");

    // TODO: implement listDimension
    List<Dimension> allDimension = [];

    final uri = Uri.parse("$urlParametrage/dim/byservice/$idService");
    final resp = await http.get(uri);
    final respBody = json.decode(resp.body);

    for (var i = 0; i < respBody.length; i++) {
      var dimensionInstance = respBody[i];
      allDimension.add(Dimension.fromJson(dimensionInstance));
    }

    return allDimension;
  }

  @override
  Future<List<Format>> listFormatByService(int idService) async {
    print("list format");

    List<Format> allFormat = [];

    final uri = Uri.parse("$urlParametrage/format/byservice/$idService");
    final resp = await http.get(uri);
    final respBody = json.decode(resp.body);
    print(respBody);
    for (var i = 0; i < respBody.length; i++) {
      var formatInstance = respBody[i];
      allFormat.add(Format.fromJson(formatInstance));
    }

    return allFormat;
  }

  @override
  Future<List<ModeImpression>> listModeImpressionByService(
      int idService) async {
    print("list mode impression");
    List<ModeImpression> allModeImpression = [];

    final uri = Uri.parse("$urlParametrage/mi/byservice/$idService");
    final resp = await http.get(uri);
    final respBody = json.decode(resp.body);

    for (var i = 0; i < respBody.length; i++) {
      var modeInstance = respBody[i];
      allModeImpression.add(ModeImpression.fromJson(modeInstance));
    }
    print("all mode impression $allModeImpression");
    return allModeImpression;
  }

  @override
  Future<List<Conception>> listConceptionByService(int idService) async {
    print("list conception");

    List<Conception> allConception = [];

    final uri =
        Uri.parse("$urlParametrage/conception/all/byservice/$idService");

    final resp = await http.get(uri);

    final respBody = json.decode(resp.body);
    print(respBody);
    for (var i = 0; i < respBody.length; i++) {
      var conceptionInstance = respBody[i];
      allConception.add(Conception.fromJson(conceptionInstance));
    }
    print(allConception);
    return allConception;
  }

  @override
  Future<List<Impression>> listImpressionByService(int idService) async {
    List<Impression> allImpression = [];
    print("list impression by service ");

    final uri = Uri.parse("$urlParametrage/impression/byservice/$idService");

    final resp = await http.get(uri);

    final respBody = json.decode(resp.body);
    print(respBody);
    for (var i = 0; i < respBody.length; i++) {
      var impressionInstance = respBody[i];
      allImpression.add(Impression.fromJson(impressionInstance));
    }
    return allImpression;
  }

  @override
  Future<List<Finition>> listFinitionByService(int idService) async {
    print("list finition by service ");

    List<Finition> allFinition = [];

    final uri = Uri.parse("$urlParametrage/finition/byservice/$idService");

    final resp = await http.get(uri);

    final respBody = json.decode(resp.body);

    for (var i = 0; i < respBody.length; i++) {
      var FinitionInstance = respBody[i];
      allFinition.add(Finition.fromJson(FinitionInstance));
    }

    return allFinition;
  }

  @override
  Future<List<Forme>> listFormeByService(int idService) async {
    print("list forme by service ");

    List<Forme> allForme = [];

    final uri = Uri.parse("$urlParametrage/formes/byservice/$idService");

    final resp = await http.get(uri);

    final respBody = json.decode(resp.body);

    for (var i = 0; i < respBody.length; i++) {
      var FormeInstance = respBody[i];
      allForme.add(Forme.fromJson(FormeInstance));
    }

    return allForme;
  }

  @override
  Future<List<Grammage>> listGrammageByService(int idService) async {
    print("list grammage by service ");

    List<Grammage> allGrammage = [];

    final uri = Uri.parse("$urlParametrage/grammage/byservice/$idService");

    final resp = await http.get(uri);

    final respBody = json.decode(resp.body);

    for (var i = 0; i < respBody.length; i++) {
      var GrammageInstance = respBody[i];
      allGrammage.add(Grammage.fromJson(GrammageInstance));
    }
    print("all grammage : $allGrammage");

    return allGrammage;
  }

  @override
  Future<List<TypePapier>> listTypePapierByService(int idService) async {
    print("list typeppaier by service ");

    List<TypePapier> allTypePapier = [];

    final uri = Uri.parse("$urlParametrage/typepapier/byservice/$idService");

    final resp = await http.get(uri);

    final respBody = json.decode(resp.body);

    for (var i = 0; i < respBody.length; i++) {
      var TypePapierInstance = respBody[i];
      allTypePapier.add(TypePapier.fromJson(TypePapierInstance));
    }
    print(allTypePapier);

    return allTypePapier;
  }

  @override
  Future<List<Categorieservice>> listCategorieService() async {
    List<Categorieservice> allCategorieService = [];

    final uri = Uri.parse("$urlParametrage/categorieservice/all");

    final resp = await http.get(uri);

    final respBody = json.decode(resp.body);

    for (var i = 0; i < respBody.length; i++) {
      var CategorieServiceInstance = respBody[i];
      allCategorieService
          .add(Categorieservice.fromJson(CategorieServiceInstance));
    }

    return allCategorieService;
  }

  @override
  Future<List<Service>> listServiceByCategorieService(
      int idCategorieService) async {
    List<Service> allService = [];

    final uri = Uri.parse(
        "$urlParametrage/service/bycategorieservice/$idCategorieService");

    final resp = await http.get(uri);

    final respBody = json.decode(resp.body);

    for (var i = 0; i < respBody.length; i++) {
      var ServiceInstance = respBody[i];
      allService.add(Service.fromJson(ServiceInstance));
    }

    return allService;
  }

  @override
  Future<Conception> findConceptionById(int idConception) async {
    final uri = Uri.parse("$urlParametrage/conception/byid/$idConception");
    final resp = await http.get(uri);
    final respbody = json.decode(resp.body);
    Conception conception = Conception.fromJson(respbody);
    return conception;
  }

  @override
  Future<Couleur> findCouleurById(int idCouleur) async {
    final uri = Uri.parse("$urlParametrage/couleur/byId/$idCouleur");
    final resp = await http.get(uri);
    final respbody = json.decode(resp.body);
    Couleur couleur = Couleur.fromJson(respbody);
    return couleur;
  }

  @override
  Future<Dimension> findDimensionById(int idDimension) async {
    final uri = Uri.parse("$urlParametrage/dim/byId/$idDimension");
    final resp = await http.get(uri);
    final respbody = json.decode(resp.body);
    Dimension dimension = Dimension.fromJson(respbody);
    return dimension;
  }

  @override
  Future<Faces> findFacesById(int idFaces) async {
    final uri = Uri.parse("$urlParametrage/faces/byId/$idFaces");
    final resp = await http.get(uri);
    final respbody = json.decode(resp.body);
    Faces faces = Faces.fromJson(respbody);
    return faces;
  }

  @override
  Future<Finition> findFinitionById(int idFinition) async {
    final uri = Uri.parse("$urlParametrage/finition/byId/$idFinition");
    final resp = await http.get(uri);
    final respbody = json.decode(resp.body);
    Finition finition = Finition.fromJson(respbody);
    return finition;
  }

  @override
  Future<Format> findFormatById(int idFormat) async {
    final uri = Uri.parse("$urlParametrage/format/byId/$idFormat");
    final resp = await http.get(uri);
    final respbody = json.decode(resp.body);
    Format format = Format.fromJson(respbody);
    return format;
  }

  @override
  Future<Forme> findFormeById(int idForme) async {
    final uri = Uri.parse("$urlParametrage/forme/byId/$idForme");
    final resp = await http.get(uri);
    final respbody = json.decode(resp.body);
    Forme forme = Forme.fromJson(respbody);
    return forme;
  }

  @override
  Future<Grammage> findGrammageById(int idGrammage) async {
    final uri = Uri.parse("$urlParametrage/grammage/byId/$idGrammage");
    final resp = await http.get(uri);
    final respbody = json.decode(resp.body);
    Grammage grammage = Grammage.fromJson(respbody);
    return grammage;
  }

  @override
  Future<Impression> findImpressionById(int idImpression) async {
    final uri = Uri.parse("$urlParametrage/impression/findbyid/$idImpression");
    final resp = await http.get(uri);
    final respbody = json.decode(resp.body);
    Impression impression = Impression.fromJson(respbody);
    return impression;
  }

  @override
  Future<ModeImpression> findModeImpresionById(int idModeImpression) async {
    final uri = Uri.parse("$urlParametrage/mi/byId/$idModeImpression");
    final resp = await http.get(uri);
    final respbody = json.decode(resp.body);
    ModeImpression modeImpression = ModeImpression.fromJson(respbody);
    return modeImpression;
  }

  @override
  Future<TypePapier> findTypePapierById(int idTypePapier) async {
    print('repo ripo de papier ');
    final uri = Uri.parse("$urlParametrage/typepapier/byId/$idTypePapier");
    final resp = await http.get(uri);
    final respbody = json.decode(resp.body);
    TypePapier typePapier = TypePapier.fromJson(respbody);

    print('Le type de papier selectionné est : ' + typePapier.intitule!);
    return typePapier;
  }

  @override
  Future<List<Couleur>> lisCouleurByService(int idService) async {
    print("lisCouleurByService");

    List<Couleur> allCouleur = [];

    final uri = Uri.parse("$urlParametrage/couleur/all/byservice/$idService");
    final resp = await http.get(uri);
    final respBody = json.decode(resp.body);

    for (var i = 0; i < respBody.length; i++) {
      var couleurI = respBody[i];
      allCouleur.add(Couleur.fromJson(couleurI));
    }
    return allCouleur;
  }

  @override
  Future<List<Faces>> listFacesByService(int idService) async {
    print("listFacesByService");

    List<Faces> allFaces = [];

    final uri = Uri.parse("$urlParametrage/faces/all/byservice/$idService");
    final resp = await http.get(uri);
    final respBody = json.decode(resp.body);
    print(respBody);

    for (var i = 0; i < respBody.length; i++) {
      var facesI = respBody[i];
      allFaces.add(Faces.fromJson(facesI));
    }

    return allFaces;
  }

  @override
  Future<List<Facturationfinition>> listFacturationFinition(
      int idFinition) async {
    print("listFacesByService");

    List<Facturationfinition> allFacturationfinitions = [];

    final uri =
        Uri.parse("$urlParametrage/facturation/byfinition/all/$idFinition");
    final resp = await http.get(uri);
    final respBody = json.decode(resp.body);

    for (var i = 0; i < respBody.length; i++) {
      var facturationFinitionElement = respBody[i];
      allFacturationfinitions
          .add(Facturationfinition.fromJson(facturationFinitionElement));
    }

    return allFacturationfinitions;
  }
}
