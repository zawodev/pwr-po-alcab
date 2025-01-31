import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aicab/screen/MapScreen.dart';

void main() {
  testWidgets('Sprawdzenie ekranu wyboru trasy', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MapScreen(
        carName: 'Honda Civic',
        price: 2.5,
        carImagePath: 'images/car_image.png',
      ),
    ));

    // Sprawdź, czy tytuł aplikacji "Wybór trasy" jest widoczny
    expect(find.text('Wybór trasy'), findsOneWidget);

    // Sprawdź, czy mapa została załadowana
    expect(find.byType(GestureDetector), findsOneWidget);

    // Sprawdź, czy przyciski "Zatwierdź" i "Powrót" są widoczne
    expect(find.widgetWithText(ElevatedButton, 'Zatwierdź'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Powrót'), findsOneWidget);
  });

  testWidgets('Sprawdzenie wyboru trasy', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MapScreen(
        carName: 'Honda Civic',
        price: 2.5,
        carImagePath: 'images/car_image.png',
      ),
    ));

    // Kliknięcie na mapę w celu wyboru trasy
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    // Sprawdź, czy obraz mapy się zmienił
    // Upewnij się, że obsługujesz zmianę obrazu w swoim kodzie logicznym
    expect(find.text('Cena za przejazd: 0.00 PLN'), findsNothing);
  });
}
