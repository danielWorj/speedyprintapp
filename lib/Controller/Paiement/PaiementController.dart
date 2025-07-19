import 'package:speedy/Model/Commande/Commande.dart';

import '../../Repository/Paiement/PaiementRepositoryInt.dart';

class PaiementController {
  final PaiementRepositoryInt paiementRepositoryInt;
  PaiementController(this.paiementRepositoryInt);

  Future<dynamic> stripePaiementIntent(Commande commande) {
    return this.paiementRepositoryInt.createStripePayementIntent(commande);
  }
}
