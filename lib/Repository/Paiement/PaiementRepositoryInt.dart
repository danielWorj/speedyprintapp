import 'package:speedy/Model/Commande/Commande.dart';

abstract class PaiementRepositoryInt {
  Future<dynamic> createStripePayementIntent(Commande commande);
}
