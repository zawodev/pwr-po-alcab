import '/model/CarModel.dart';
import '/model/RouteModel.dart';
import '/model/UserModel.dart';


List<CarModel> getAvailableCars(){
  List<CarModel> list = [];
  list.add(CarModel(id: 1, name: "Honda Civic", year: 2006, price: 2.13, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", inUse: true, service: DateTime.now()));
  list.add(CarModel(id: 2, name: "Chevrolet Corvette", year: 2012, price: 3.25, img: 'images/chevrolet (1).png', img2: "images/chevrolet (2).png", status: "pojazd w normie", inUse: true, service: DateTime.now()));
  list.add(CarModel(id: 3, name: "Toyota Corolla", year: 2008, price: 1.37, img: 'images/toyota corolla.png', img2: "images/toyota corolla 2.png", status: "pojazd w normie", inUse: true, service: DateTime.now()));
  list.add(CarModel(id: 4, name: "Ford Model T", year: 1908, price: 0.12, img: 'images/ford one.jpg', img2: "images/ford one 2.jpg", status: "pojazd w normie", inUse: true, service: DateTime.now()));
  list.add(CarModel(id: 5, name: "Arial Atom", year: 2015, price: 4.88, img: 'images/arial atom.png', img2: "images/arial atom 2.jpg", status: "pojazd w normie", inUse: true, service: DateTime.now()));
  list.add(CarModel(id: 6, name: "De Lorian", year: 2008, price: 5.70, img: 'images/delory.jpg', img2: "images/delory2.jpg", status: "pojazd w normie", inUse: true, service: DateTime.now()));
  list.add(CarModel(id: 7, name: "Grotti Itali GTO Stinger TT", year: 2013, price: 7.79, img: 'images/grotti_itali.png', img2: "images/grotti_itali.jpg", status: "pojazd w normie", inUse: true, service: DateTime.now()));
  return list;


}

List<RouteModel> getAvailableRoutes() {
  return [
    RouteModel(routeImage: 'images/map_1.png', distance: 12.5, estimatedTime: 17), // images/map1.png
    RouteModel(routeImage: 'images/map_2.png', distance: 21.7, estimatedTime: 24),
    RouteModel(routeImage: 'images/map_3.png', distance: 8.3, estimatedTime: 12),
  ];
}



List<UserModel> getUsers() {
  return [
    UserModel(
      firstName: "Jan",
      lastName: "Kowalski",
      email: "jankowalski@gmail.com",
      phoneNumber: "123456789",
      password: "password123",
    ),
    UserModel(
      firstName: "Anna",
      lastName: "Nowak",
      email: "anna.nowak@wp.pl",
      phoneNumber: "987654321",
      password: "securePass456",
    ),
    UserModel(
      firstName: "Tomasz",
      lastName: "Zieliński",
      email: "tomasz.zielinski@example.com",
      phoneNumber: "654123987",
      password: "pass987",
    ),
  ];
}

