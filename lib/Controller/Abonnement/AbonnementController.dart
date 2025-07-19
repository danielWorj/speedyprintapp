import 'package:speedy/Model/Abonnement/DetailsOffre.dart';
import 'package:speedy/Repository/Abonnement/OffreRepositoryInt.dart';

import '../../Model/Abonnement/Offre.dart';

class OffreController {
  final OffreRepositoryInt offreRepositoryInt;
  OffreController(this.offreRepositoryInt);

  Future<List<Offre>> fecthAllOffre() {
    return this.offreRepositoryInt.findAllOffre();
  }

  Future<List<Detailsoffre>> fecthAllDetailOffre(int idOffre) {
    return this.offreRepositoryInt.findAllDetailOffreByOffre(idOffre);
  }
}
