import 'package:speedy/Repository/EndPoint/variable.dart';

import '../Client.dart';

class Message {
  int? idMessage;
  String? content;
  bool? statut;
  String? localDate;
  Client? client;

  Message.fromJson(Map<String, dynamic> json) {
    idMessage = json['idMessage'];
    content = json['content'];
    statut = json['statut'];
    localDate = json['localDate'];
    client =
        json['client'] == null ? clientVar : Client.fromJson(json['client']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['idMessage'] = idMessage.toString();
    data['content'] = content;
    data['statut'] = statut.toString();
    data['localDate'] = localDate;
    data['client'] = client!.idUser.toString();

    return data;
  }

  Message(
      this.idMessage, this.content, this.statut, this.localDate, this.client);
}
