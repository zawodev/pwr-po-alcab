import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '/utils/DataExamples.dart';
import '/model/RouteModel.dart';

class MapScreen extends StatefulWidget {
  final String carName;
  final double price;
  final String carImagePath;

  const MapScreen({super.key, required this.carName, required this.price, required this.carImagePath});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int selectedRouteIndex = -1;
  bool tollRoads = false;
  late List<RouteModel> routes;
  String currentMapImage = 'images/map_0.png';
  double calculatedPrice = 0.0;
  //String carImage = 'images/civic_mini.png'; // mockowy obrazek auta

  @override
  void initState() {
    super.initState();
    routes = getAvailableRoutes();
    calculatedPrice = 0;
  }

  void selectRoute(int index) {
    setState(() {
      if (selectedRouteIndex == index) {
        selectedRouteIndex = -1;
        currentMapImage = 'images/map_0.png';
        calculatedPrice = 0;
      } else {
        selectedRouteIndex = index;
        currentMapImage = routes[index].routeImage;
        calculatedPrice = widget.price * routes[index].distance;
      }
    });
  }

  void confirmRoute() {
    if (selectedRouteIndex < 0) {
      _showDialog(
        message: "Nie wybrano żadnej trasy. Proszę wybrać trasę przed zatwierdzeniem.",
        positiveText: "OK",
        negativeText: "Anuluj",
      );
      return;
    }

    _showDialog(
      message: "Czy na pewno chcesz zamówić tę trasę?",
      positiveText: "Tak",
      negativeText: "Nie",
      onAccept: () {
        Navigator.popUntil(context, (route) => route.isFirst);
      },
    );
  }

  void showCancelDialog() {
    _showDialog(
      message: "Czy na pewno chcesz cofnąć? Utracisz zmiany.",
      positiveText: "Tak",
      negativeText: "Nie",
      onAccept: () {
        Navigator.pop(context);
      },
    );
  }

  void _showDialog({
    required String message,
    String? positiveText,
    String? negativeText,
    VoidCallback? onAccept,
  }) {
    showConfirmDialog(
      context,
      message,
      positiveText: positiveText ?? "OK",
      negativeText: negativeText ?? "Anuluj",
      onAccept: onAccept,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wybór trasy'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: showCancelDialog,
        ),
      ),
      body: Column(
        children: [
          // mapa fragment tutaj
          AspectRatio(
            aspectRatio: 4 / 3,
            child: GestureDetector(
              onTapDown: (details) {
                double dx = details.localPosition.dx;
                double dy = details.localPosition.dy;
                double width = context.size!.width;
                double height = width * 3 / 4;

                bool topHalf = dy < height / 2;
                bool leftHalf = dx < width / 2;

                if (topHalf && leftHalf) {
                  selectRoute(0);
                } else if (topHalf && !leftHalf) {
                  selectRoute(1);
                } else if (!topHalf && leftHalf) {
                  selectRoute(2);
                } else {
                  _showDialog(
                    message: "Brak dostępnych tras do tego punktu.",
                    positiveText: "OK",
                    negativeText: "Anuluj",
                  );
                }
              },
              child: Image.asset(
                currentMapImage,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  debugPrint("Błąd ładowania obrazu: $currentMapImage");
                  return const Center(
                    child: Text("Nie znaleziono mapy"),
                  );
                },
              ),
            ),
          ),
          // panel z informacjami tutaj
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      // sekcja pojazdu
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            widget.carImagePath,
                            width: 120,
                            height: 120,
                            fit: BoxFit.contain, //żeby się obrazek w pełni wyświetlał
                          ),
                          const SizedBox(height: 8),
                          Text('Model: ${widget.carName}', style: boldTextStyle()),
                          Text('Rok: 2006', style: secondaryTextStyle()),
                        ],
                      ),
                      const SizedBox(width: 32),
                      // sekcja trasy
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Cena za przejazd: ${calculatedPrice.toStringAsFixed(2)} PLN',
                                style: boldTextStyle(),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Długość trasy: ${selectedRouteIndex >= 0 ? routes[selectedRouteIndex].distance.toStringAsFixed(1) : 'N/A'} km',
                                style: secondaryTextStyle(),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Czas podróży: ${selectedRouteIndex >= 0 ? routes[selectedRouteIndex].estimatedTime : 'N/A'} min',
                                style: secondaryTextStyle(),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: tollRoads,
                        onChanged: (value) {
                          setState(() {
                            tollRoads = value ?? false;
                          });
                        },
                      ),
                      const Text('Płatne odcinki'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // przyciski zatwierdź i powrót
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: confirmRoute,
                          child: const Text('Zatwierdź'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: showCancelDialog,
                          child: const Text('Powrót'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
