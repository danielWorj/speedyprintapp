import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:speedy/Model/Abonnement/DetailsOffre.dart';
import 'package:speedy/Model/Abonnement/Offre.dart';
import 'package:speedy/Repository/Abonnement/OffreRepositoryInt.dart';
import 'package:speedy/Repository/EndPoint/EndPoint.dart';

class OffrerepositoryImpl implements OffreRepositoryInt {
  @override
  Future<List<Offre>> findAllAbonnementByClient(int idClient) async {
    // TODO: implement findAllOffre

    List<Offre> allOffre = [];

    final uri = Uri.parse("$urlAbonnement/all/client/$idClient");

    final resp = await http.get(uri);

    final jsonResp = json.decode(resp.body);

    for (var i = 0; i < jsonResp.length; i++) {
      var commandeInst = jsonResp[i];
      allOffre.add(Offre.fromJson(commandeInst));
    }

    return allOffre;
  }

  @override
  Future<List<Offre>> findAllOffre() async {
    List<Offre> allOffre = [];

    final uri = Uri.parse("$urlOffre/all");

    final resp = await http.get(uri);

    final jsonResp = json.decode(resp.body);

    for (var i = 0; i < jsonResp.length; i++) {
      var commandeInst = jsonResp[i];
      allOffre.add(Offre.fromJson(commandeInst));
    }

    return allOffre;
  }

  @override
  Future<List<Detailsoffre>> findAllDetailOffreByOffre(int idOffre) async {
    List<Detailsoffre> detailsOffres = [];

    final uri = Uri.parse("$urlAbonnement/details/offre/all/$idOffre");

    final resp = await http.get(uri);

    final jsonResp = json.decode(resp.body);

    for (var i = 0; i < jsonResp.length; i++) {
      var detail = jsonResp[i];
      detailsOffres.add(Detailsoffre.fromJson(detail));
    }

    return detailsOffres;
  }
}
