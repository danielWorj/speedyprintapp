import 'package:speedy/Model/Client.dart';
import 'package:speedy/Repository/Client/ClientRepositoryInt.dart';

class Clientcontroller {
  final ClientRepositoryInt clientRepositoryInt;
  Clientcontroller(this.clientRepositoryInt);

  Future<Client> createAccount(Client client) {
    return this.clientRepositoryInt.createAccount(client);
  }
}
