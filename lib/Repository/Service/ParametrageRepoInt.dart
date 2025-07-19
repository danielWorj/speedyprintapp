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
import 'package:speedy/Model/Service/TypePapier.dart';

import '../../Model/Service/Service.dart';

abstract class ParametrageRepoInt {
  Future<List<Service>> listService();
  Future<List<Categorieservice>> listCategorieService();
  Future<List<Service>> listServiceByCategorieService(int idCategorieService);

  Future<List<ModeImpression>> listModeImpressionByService(int idService);
  Future<List<Dimension>> listDimensionByService(int idService);
  Future<List<Format>> listFormatByService(int idService);
  Future<List<Conception>> listConceptionByService(int idService);
  Future<List<Impression>> listImpressionByService(int idService);
  Future<List<TypePapier>> listTypePapierByService(int idService);
  Future<List<Finition>> listFinitionByService(int idService);
  Future<List<Forme>> listFormeByService(int idService);
  Future<List<Grammage>> listGrammageByService(int idService);
  Future<List<Faces>> listFacesByService(int idService);
  Future<List<Couleur>> lisCouleurByService(int idService);
  Future<List<Facturationfinition>> listFacturationFinition(int idFinition);

  //By Id

  Future<ModeImpression> findModeImpresionById(int idModeImpression);
  Future<Dimension> findDimensionById(int idDimension);
  Future<Format> findFormatById(int idFormat);
  Future<Conception> findConceptionById(int idConception);
  Future<Impression> findImpressionById(int idImpression);
  Future<TypePapier> findTypePapierById(int idTypePapier);
  Future<Finition> findFinitionById(int idFinition);
  Future<Forme> findFormeById(int idForme);
  Future<Grammage> findGrammageById(int idGrammage);
  Future<Faces> findFacesById(int idFaces);
  Future<Couleur> findCouleurById(int idCouleur);
}
