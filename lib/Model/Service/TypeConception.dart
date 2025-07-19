class TypeConception {
  int? idTypeConception;
  String? intitule;

  TypeConception(this.idTypeConception, this.intitule);

  TypeConception.fromJson(Map<String, dynamic> json) {
    idTypeConception = json['idTypeConception'];
    intitule = json['intitule'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['idTypeConception'] = idTypeConception.toString();
    data['intitule'] = intitule;

    return data;
  }
}
