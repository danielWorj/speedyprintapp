import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:speedy/Model/Client.dart';
import 'package:speedy/Repository/Client/ClientRepositoryInt.dart';
import 'package:speedy/Repository/EndPoint/EndPoint.dart';

class ClientRepositoryImpl implements ClientRepositoryInt {
  @override
  Future<Client> createAccount(Client client) async {
    // TODO: implement createAccount
    final uri = Uri.parse("$urlClient/create/bymobile");
    final resp = await http.post(uri, body: client.toJson());

    Client clientCreated = new Client.fromJson(json.decode(resp.body));

    return clientCreated;
  }
}
