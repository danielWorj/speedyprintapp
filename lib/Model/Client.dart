class Client {
  int? idUser;
  String? nom;
  String? password;
  String? contact;
  String? email;
  String? bankCard;
  bool? origin;

  Client(this.idUser, this.nom, this.password, this.contact, this.email,
      this.bankCard, this.origin);

  Client.fromJson(Map<String, dynamic> json) {
    idUser = json['idUser'];
    nom = json['nomUtilisateur'];
    password = json['password'];
    contact = json['contact'];
    email = json['email'];
    bankCard = json['bankCard'];
    origin = json['origin'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['idUser'] = idUser.toString();
    data['nomUtilisateur'] = nom;
    data['password'] = password;
    data['contact'] = contact;
    data['email'] = email;
    data['bankCard'] = bankCard;
    data['origin'] = origin.toString();

    return data;
  }
}
