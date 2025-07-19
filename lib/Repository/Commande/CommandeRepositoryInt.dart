import 'dart:io';

import 'package:speedy/Model/CarteVisite.dart';
import 'package:speedy/Model/Commande/Commande.dart';
import 'package:speedy/Model/Commande/ConceptionCommande.dart';
import 'package:speedy/Model/Flyer.dart';
import 'package:speedy/Model/ImageFlyer.dart';
import 'package:speedy/Model/ImageRollUp.dart';
import 'package:speedy/Model/RollUp.dart';
import 'package:speedy/Model/ServerResponse.dart';
import 'package:speedy/Model/Service/Livraison.dart';

abstract class Commanderepositoryint {
  Future<Cartevisite> commandeCarteVisite(Cartevisite carteVisite, File file);

  Future<Flyer> commandeFlyer(Flyer flyer, Imageflyer imageflyer, File file);

  Future<Rollup> commandeRollUp(
      Rollup rollup, Imagerollup imagerollup, File file);

/**
 * Mise à jour
 */

  Future<List<Commande>> findAllCommandeByClient(int idClient);
  Future<bool> commandeService(Commande commande, File file, File? fileVerso);

  Future<List<Livraison>> findAllLivraisonByClient(int idClient);

  Future<List<ConceptionCommande>> findAllConceptionCommandeByClient(
      int idClient);
  Future<bool> avisConceptionCommande(ConceptionCommande concepiton);

  Future<ServerResponse> confirmProduction(int idCommande);
}
