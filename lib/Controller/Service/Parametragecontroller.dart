import 'package:speedy/Model/Service/CategorieService.dart';
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
import 'package:speedy/Model/Service/TypePapier.dart';
import 'package:speedy/Repository/Service/ParametrageRepoInt.dart';

import '../../Model/Service/FacturationFinition.dart';
import '../../Model/Service/Service.dart';

class Parametragecontroller {
  final ParametrageRepoInt parametrageRepoInt;
  Parametragecontroller(this.parametrageRepoInt);

  Future<List<Service>> fetchAllService() {
    print("service controller");
    return parametrageRepoInt.listService();
  }

  Future<List<Categorieservice>> fetchAllCategorieService() {
    print("service controller");
    return parametrageRepoInt.listCategorieService();
  }

  Future<List<Service>> fecthServiceByCategorieService(int idCategorie) {
    return parametrageRepoInt.listServiceByCategorieService(idCategorie);
  }

  Future<List<ModeImpression>> fecthModeImpression(int idService) {
    return parametrageRepoInt.listModeImpressionByService(idService);
  }

  Future<List<Format>> fecthFormat(int idFormat) {
    return parametrageRepoInt.listFormatByService(idFormat);
  }

  Future<List<Dimension>> fecthDimension(int idDimension) {
    return parametrageRepoInt.listDimensionByService(idDimension);
  }

  Future<List<Conception>> fetchConception(int idService) {
    return parametrageRepoInt.listConceptionByService(idService);
  }

  Future<List<Impression>> fetchImpression(int idService) {
    return parametrageRepoInt.listImpressionByService(idService);
  }

  Future<List<TypePapier>> fetchTypePapier(int idService) {
    return parametrageRepoInt.listTypePapierByService(idService);
  }

  Future<List<Grammage>> fetchGrammage(int idService) {
    return parametrageRepoInt.listGrammageByService(idService);
  }

  Future<List<Finition>> fetchFinition(int idService) {
    return parametrageRepoInt.listFinitionByService(idService);
  }

  Future<List<Forme>> fetchForme(int idService) {
    return parametrageRepoInt.listFormeByService(idService);
  }

  Future<List<Couleur>> fetchCouleur(int idService) {
    return parametrageRepoInt.lisCouleurByService(idService);
  }

  Future<List<Faces>> fetchFaces(int idService) {
    return parametrageRepoInt.listFacesByService(idService);
  }

  //by Id
  Future<ModeImpression> fetchModeImpressionById(int id) {
    return parametrageRepoInt.findModeImpresionById(id);
  }

  Future<Dimension> fetchDimensionById(int id) {
    return parametrageRepoInt.findDimensionById(id);
  }

  Future<Format> fetchFormatById(int id) {
    return parametrageRepoInt.findFormatById(id);
  }

  Future<Conception> fetchConceptionById(int id) {
    return parametrageRepoInt.findConceptionById(id);
  }

  Future<Impression> fetchImpressionById(int id) {
    return parametrageRepoInt.findImpressionById(id);
  }

  Future<TypePapier> fetchTypePapierById(int id) {
    return parametrageRepoInt.findTypePapierById(id);
  }

  Future<Finition> fetchFinitionById(int id) {
    return parametrageRepoInt.findFinitionById(id);
  }

  Future<Forme> fetchFormeById(int id) {
    return parametrageRepoInt.findFormeById(id);
  }

  Future<Grammage> fetchGrammageById(int id) {
    return parametrageRepoInt.findGrammageById(id);
  }

  Future<Faces> fetchFacesById(int id) {
    return parametrageRepoInt.findFacesById(id);
  }

  Future<Couleur> fetchCouleurById(int id) {
    return parametrageRepoInt.findCouleurById(id);
  }

  Future<List<Facturationfinition>> fetchFacturationFinition(int id) {
    return parametrageRepoInt.listFacturationFinition(id);
  }
}
