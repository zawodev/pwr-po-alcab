import '/model/CarModel.dart';
import '/model/RouteModel.dart';


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
  list.add(CarModel(id: 1, name: "Honda Civic", year: 2006, price: 2.13, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", inUse: true, service: DateTime.now()));
  list.add(CarModel(id: 2, name: "Honda Civi2", year: 2006, price: 3.25, img: 'images/civic2006_full.jpg', img2: "images/civic_mini.png", status: "pojazd w normie", inUse: true, service: DateTime.now()));
  list.add(CarModel(id: 3, name: "Honda Civic", year: 2006, price: 5.00, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", inUse: true, service: DateTime.now()));
  list.add(CarModel(id: 4, name: "Honda Civic", year: 2006, price: 5.00, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", inUse: true, service: DateTime.now()));
  list.add(CarModel(id: 5, name: "Honda Civic", year: 2006, price: 5.00, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", inUse: true, service: DateTime.now()));
  list.add(CarModel(id: 6, name: "Honda Civic", year: 2006, price: 5.00, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", inUse: true, service: DateTime.now()));
  return list;


}

List<RouteModel> getAvailableRoutes() {
  return [
    RouteModel(routeImage: 'images/map_1.png', distance: 12.5, estimatedTime: 17), // images/map1.png
    RouteModel(routeImage: 'images/map_2.png', distance: 21.7, estimatedTime: 24),
    RouteModel(routeImage: 'images/map_3.png', distance: 8.3, estimatedTime: 12),
  ];
}
