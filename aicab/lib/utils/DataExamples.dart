import '/model/CarModel.dart';


List<CarModel> getAllDrinks() {
  List<CarModel> list = [];
  list.add(CarModel(id: 1, name: "Honda Civic", year: 2006, price: 5.00, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", service: DateTime.now()));
  list.add(CarModel(id: 2, name: "Honda Civic", year: 2006, price: 5.00, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", service: DateTime.now()));
  list.add(CarModel(id: 3, name: "Honda Civic", year: 2006, price: 5.00, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", service: DateTime.now()));
  list.add(CarModel(id: 4, name: "Honda Civic", year: 2006, price: 5.00, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", service: DateTime.now()));
  list.add(CarModel(id: 5, name: "Honda Civic", year: 2006, price: 5.00, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", service: DateTime.now()));
  list.add(CarModel(id: 6, name: "Honda Civic", year: 2006, price: 5.00, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", service: DateTime.now()));
  return list;
}

List<CarModel> getAvailableCars(){
  List<CarModel> list = [];
  list.add(CarModel(id: 1, name: "Honda Civic", year: 2006, price: 5.00, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", inUse: true, service: DateTime.now()));
  list.add(CarModel(id: 2, name: "Honda Civic", year: 2006, price: 5.00, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", inUse: true, service: DateTime.now()));
  list.add(CarModel(id: 3, name: "Honda Civic", year: 2006, price: 5.00, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", inUse: true, service: DateTime.now()));
  list.add(CarModel(id: 4, name: "Honda Civic", year: 2006, price: 5.00, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", inUse: true, service: DateTime.now()));
  list.add(CarModel(id: 5, name: "Honda Civic", year: 2006, price: 5.00, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", inUse: true, service: DateTime.now()));
  list.add(CarModel(id: 6, name: "Honda Civic", year: 2006, price: 5.00, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", inUse: true, service: DateTime.now()));
  return list;


}