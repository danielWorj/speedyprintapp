class Imagerollup{
  int ?idImageRollUp ;
  String ? image ;
  int ? rollup ;

  Imagerollup(this.idImageRollUp, this.image, this.rollup);

  Imagerollup.fromJson(Map<String,dynamic> json){
    idImageRollUp = json['idImageRollUp'];
    image = json['image'];
    rollup = json['rollup'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();

    data['idImageRollup'] = idImageRollUp.toString();
    data['image'] = image;
    data['rollup'] = rollup;

    return data;
  }
}