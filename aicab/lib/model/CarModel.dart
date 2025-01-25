class CarModel {
  int? id;
  String? name;
  int? year;
  double? price;
  String? img;
  String? img2;
  String? status;
  bool inUse;
  DateTime? service;

  CarModel({this.id, this.name, this.year, this.price, this.img, this.img2, this.status, this.inUse=false, this.service});
}