import 'package:speedy/Model/Abonnement/DetailsOffre.dart';
import 'package:speedy/Model/Abonnement/Offre.dart';

abstract class OffreRepositoryInt {
  Future<List<Offre>> findAllAbonnementByClient(int idClient);

  Future<List<Offre>> findAllOffre();

  Future<List<Detailsoffre>> findAllDetailOffreByOffre(int idOffre);
}
