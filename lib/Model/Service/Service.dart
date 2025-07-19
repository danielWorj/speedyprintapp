import 'package:speedy/Model/Service/CategorieService.dart';
import 'package:speedy/Repository/EndPoint/variable.dart';

class Service {
  int? idServices;
  String? intitule;
  String? description;
  String? image;
  Categorieservice? categorieService;

  Service(this.idServices, this.intitule, this.description, this.image,
      this.categorieService);

  Service.fromJson(Map<String, dynamic> json) {
    idServices = json['idServices'];
    intitule = json['intitule'];
    description = json['description'];
    image = json['image'];
    categorieService = json['categorieService'] == null
        ? categorieserviceVar
        : Categorieservice.fromJson(json['categorieService']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['idServices'] = idServices.toString();
    data['intitule'] = intitule;
    data['description'] = description;
    data['image'] = image;
    data['categorieService'] = categorieService!.idCategorieService.toString();
    return data;
  }
}
