import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:speedy/Model/CarteVisite.dart';
import 'package:speedy/Model/Commande/Commande.dart';
import 'package:speedy/Model/Commande/ConceptionCommande.dart';
import 'package:speedy/Model/Commande/ImageCommande.dart';
import 'package:speedy/Model/Flyer.dart';
import 'package:speedy/Model/RollUp.dart';
import 'package:speedy/Model/ServerResponse.dart';
import 'package:speedy/Repository/Commande/CommandeRepositoryInt.dart';
import 'package:speedy/Repository/EndPoint/EndPoint.dart';

import '../../Model/ImageFlyer.dart';
import '../../Model/ImageRollUp.dart';
import '../../Model/Service/Livraison.dart';

class Commanderepositoryimpl implements Commanderepositoryint {
  @override
  Future<Cartevisite> commandeCarteVisite(
      Cartevisite carteVisite, File file) async {
    // TODO: implement commandeCarteVisite

    final uri = Uri.parse("$urlCommande/cartevisite/create");
    final uriImage = Uri.parse("$urlCommande/image");
    final resp = await http.post(uri, body: carteVisite.toJson());

    print(resp.body);
    final respBodyJsonise = json.decode(resp.body);

    Cartevisite cartevisite = new Cartevisite.fromJson(respBodyJsonise);

    if (cartevisite != null) {
      var request = http.MultipartRequest('POST', uriImage);
      request.files.add(await http.MultipartFile.fromPath('file', file.path));
      final response = await request.send();
    }

    return cartevisite;
  }

  @override
  Future<Flyer> commandeFlyer(
      Flyer flyer, Imageflyer imageflyer, File file) async {
    // TODO: implement commandeFlyer

    final uri = Uri.parse("$urlCommande/flyer/create");
    final uriImageSave = Uri.parse("$urlCommande/flyer/createImage");

    final uriImage = Uri.parse("$urlCommande/image");
    final resp = await http.post(uri, body: flyer.toJson()); //create flyer

    Flyer flyerCreate = new Flyer.fromJson(json.decode(resp.body));

    if (flyer != null) {
      //flyer crée
      imageflyer.flyer =
          flyer.idFlyer; //on change le '1' de la vue par l'id du flyer créer

      final respImageSave =
          await http.post(uri, body: imageflyer.toJson()); //create flyer

      ServerResponse serverResponse =
          ServerResponse.fromJson(json.decode(respImageSave.body));

      if (serverResponse.success!) {
        var request = http.MultipartRequest('POST', uriImage);
        request.files.add(await http.MultipartFile.fromPath('file', file.path));
        final response = await request.send();
      }
    }

    return flyerCreate;
  }

  @override
  Future<Rollup> commandeRollUp(
      Rollup rollup, Imagerollup imagerollup, File file) async {
    // TODO: implement commandeRollUp
    final uri = Uri.parse("$urlCommande/roll/create");
    final uriImageRoll = Uri.parse("$urlCommande/roll/image");

    final uriImage = Uri.parse("$urlCommande/image");
    final resp = await http.post(uri, body: rollup.toJson());

    Rollup rollupCreated = new Rollup.formJson(json.decode(resp.body));

    if (rollup != null) {
      imagerollup.rollup = rollupCreated
          .idRollup; // on fournit l'id du roll qi vient d'être crée

      final respImageRoll = await http.post(uri, body: imagerollup.toJson());

      ServerResponse serverResponse =
          ServerResponse.fromJson(json.decode(respImageRoll.body));

      if (serverResponse.success!) {
        var request = http.MultipartRequest('POST', uriImage);
        request.files.add(await http.MultipartFile.fromPath('file', file.path));
        final response = await request.send();
      }
    }

    return rollupCreated;
  }

  @override
  Future<bool> commandeService(
      Commande commande, File file, File? fileVerso) async {
    // TODO: implement commandeService

    final uri = Uri.parse("$urlCommande/bymob/create");
    final resp = await http.post(uri, body: commande.toJson());
    Commande commandeCreated = Commande.fromJson(json.decode(resp.body));

    //Quand la commande est ajouté et on ajoute l'image

    final uriImage = Uri.parse("$urlCommande/sendImage");

    if (commandeCreated != null) {
      var request = http.MultipartRequest('POST', uriImage);
      request.files.add(await http.MultipartFile.fromPath('file', file.path));
      final response = await request.send();
    }

    String fileName = file!.path.split('/').last;

    ImageCommande imageCommande = ImageCommande(1, fileName, commandeCreated);

    final uriImageCommande = Uri.parse("$urlCommande/imagecomande/create");
    final respImageCommande =
        await http.post(uriImageCommande, body: imageCommande.toJson());
    ServerResponse serverResponse =
        ServerResponse.fromJson(json.decode(respImageCommande.body));
    /***
    if(serverResponse.success!){
      //Image verso
      String fileNameVerso = fileVerso!.path.split('/').last;

      ImageCommande imageCommande = ImageCommande(1, fileName, commandeCreated);

      final uriImageCommande = Uri.parse("$urlCommande/imagecomande/create");
      final respImageCommande =
      await http.post(uriImageCommande, body: imageCommande.toJson());
      ServerResponse serverResponse =
      ServerResponse.fromJson(json.decode(respImageCommande.body));
    }
      **/
    return true;
  }

  @override
  Future<List<Commande>> findAllCommandeByClient(int idClient) async {
    List<Commande> commandeList = [];

    final uri = Uri.parse("$urlCommande/allbyClient/$idClient");
    final resp = await http.get(uri);

    final respBody = json.decode(resp.body);

    for (var i = 0; i < respBody.length; i++) {
      var commandeInstance = respBody[i];

      commandeList.add(Commande.fromJson(commandeInstance));
    }

    print(commandeList);

    return commandeList;
  }

  @override
  Future<List<Livraison>> findAllLivraisonByClient(int idClient) async {
    // TODO: implement findAllLivraisonByClient
    List<Livraison> allLivraison = [];

    print("$urlLivraison/byclient/$idClient");

    final uri = Uri.parse("$urlLivraison/byclient/$idClient");
    final resp = await http.get(uri);

    final respBody = json.decode(resp.body);

    for (var i = 0; i < respBody.length; i++) {
      var commandeInst = respBody[i];
      allLivraison.add(Livraison.fromJson(commandeInst));
    }

    return allLivraison;
  }

  @override
  Future<List<ConceptionCommande>> findAllConceptionCommandeByClient(
      int idClient) async {
    // TODO: implement findAllConceptionCommandeByClient
    List<ConceptionCommande> allConceptionCommande = [];

    final uri = Uri.parse("$urlConceptionCommande/all/byclient/$idClient");
    final resp = await http.get(uri);

    final respBody = json.decode(resp.body);

    print(respBody);

    for (var i = 0; i < respBody.length; i++) {
      var conceptionCommandeInt = respBody[i];
      allConceptionCommande
          .add(ConceptionCommande.fromJson(conceptionCommandeInt));
    }
    return allConceptionCommande;
  }

  @override
  Future<bool> avisConceptionCommande(ConceptionCommande concepiton) async {
    final uri = Uri.parse("$urlCommande/conception/commande/avis");
    final resp = await http.post(uri, body: concepiton.toJson());

    final respBodyJsonise = json.decode(resp.body);
    print(respBodyJsonise);
    ServerResponse serverResponse = ServerResponse.fromJson(respBodyJsonise);
    return serverResponse!.success!;
  }

  @override
  Future<ServerResponse> confirmProduction(int idCommande) async {
    print("confirm production");
    int idProduction = 2; //de la bd
    final uri = Uri.parse("$urlCommande/etat/change/$idCommande/$idProduction");
    final resp = await http.get(uri);

    final respBody = json.decode(resp.body);
    print(respBody);
    ServerResponse serverResponse = ServerResponse.fromJson(respBody);
    return serverResponse;
  }
}
