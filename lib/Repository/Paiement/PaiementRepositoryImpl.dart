import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:speedy/Model/Commande/Commande.dart';
import 'package:speedy/Repository/EndPoint/EndPoint.dart';
import 'package:speedy/Repository/Paiement/PaiementRepositoryInt.dart';

class PaiementrepositoryImpl implements PaiementRepositoryInt {
  @override
  Future createStripePayementIntent(Commande commande) async {
    // TODO: implement createStripePayementIntent
    final uri = Uri.parse("$urlPaiement/checkout");
    final resp = await http.post(uri, body: commande.toJson());
    final jsonResponse = json.decode(resp.body);
    return jsonResponse;
  }
}
