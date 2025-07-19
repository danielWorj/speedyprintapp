class Categorieservice {
  int? idCategorieService;
  String? intitule;
  String? image;

  Categorieservice(this.idCategorieService, this.intitule, this.image);

  Categorieservice.fromJson(Map<String, dynamic> json) {
    idCategorieService = json['idCategorieService'];
    intitule = json['intitule'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['idCategorieService'] = idCategorieService.toString();
    data['intitule'] = intitule;
    data['image'] = image;

    return data;
  }
}
