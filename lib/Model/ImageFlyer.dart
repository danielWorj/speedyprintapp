class Imageflyer {
  //Image flyer dto
  int? idImageFlyer;
  String? image;
  int? flyer;

  Imageflyer(this.idImageFlyer, this.image, this.flyer);

  Imageflyer.fromJson(Map<String, dynamic> json) {
    idImageFlyer = json['idImageFlyer'];
    image = json['image'];
    flyer = json['flyer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['idImageFlyer'] = idImageFlyer.toString();
    data['image'] = image;
    data['flyer'] = flyer;

    return data;
  }
}
