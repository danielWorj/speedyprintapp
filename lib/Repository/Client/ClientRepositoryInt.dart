import 'package:speedy/Model/Client.dart';

abstract class ClientRepositoryInt {
  Future<Client> createAccount(Client client);
}
