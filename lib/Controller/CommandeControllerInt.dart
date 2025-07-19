import 'dart:io';

import 'package:speedy/Model/CarteVisite.dart';
import 'package:speedy/Model/Commande/Commande.dart';
import 'package:speedy/Model/Commande/ConceptionCommande.dart';
import 'package:speedy/Model/Flyer.dart';
import 'package:speedy/Model/ImageFlyer.dart';
import 'package:speedy/Model/ImageRollUp.dart';
import 'package:speedy/Model/RollUp.dart';
import 'package:speedy/Model/Service/Livraison.dart';
import 'package:speedy/Repository/Commande/CommandeRepositoryInt.dart';

import '../Model/ServerResponse.dart';

class Commandecontrollerint {
  final Commanderepositoryint commanderepositoryint;
  Commandecontrollerint(this.commanderepositoryint);

  Future<Cartevisite> commandeCarteVisite(Cartevisite cartevisite, File file) {
    return commanderepositoryint.commandeCarteVisite(cartevisite, file);
  }

  Future<Flyer> commandeFlyer(Flyer flyer, Imageflyer imageflyer, File file) {
    return commanderepositoryint.commandeFlyer(flyer, imageflyer, file);
  }

  Future<Rollup> commandeRollUp(
      Rollup rollup, Imagerollup imagerollup, File file) {
    return commanderepositoryint.commandeRollUp(rollup, imagerollup, file);
  }

/**
 * Commande controller
 */

  Future<bool> createCommande(Commande commande, File file, File? fileVerso) {
    return commanderepositoryint.commandeService(commande, file, fileVerso);
  }

  Future<List<Commande>> findCommandeByClient(int idClient) {
    return commanderepositoryint.findAllCommandeByClient(idClient);
  }

  Future<List<Livraison>> fetchLivraisonByClient(int idClient) {
    return commanderepositoryint.findAllLivraisonByClient(idClient);
  }

  Future<List<ConceptionCommande>> fecthConceptionCommande(int idClient) {
    return commanderepositoryint.findAllConceptionCommandeByClient(idClient);
  }

  Future<bool> createAvisConceptionCommande(ConceptionCommande conception) {
    return commanderepositoryint.avisConceptionCommande(conception);
  }

  Future<ServerResponse> sendConceptionToProduction(int idCommande) {
    return commanderepositoryint.confirmProduction(idCommande);
  }
}
