import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aicab/screen/DashBoardScreen.dart';
import 'package:aicab/fragment/RegisterFragment.dart';

void main() {
  testWidgets('Sprawdzenie poprawnego wyświetlenia formularza rejestracji', (WidgetTester tester) async {
    // Renderuj ekran rejestracji
    await tester.pumpWidget(const MaterialApp(home: RegisterFragment()));

    // Sprawdź, czy pola tekstowe są widoczne
    expect(find.text('Imię'), findsOneWidget);
    expect(find.text('Nazwisko'), findsOneWidget);
    expect(find.text('Adres email'), findsOneWidget);
    expect(find.text('Numer telefonu'), findsOneWidget);
    expect(find.text('Hasło'), findsOneWidget);

    // Sprawdź, czy przycisk rejestracji jest widoczny
    expect(find.widgetWithText(ElevatedButton, 'Rejestruj'), findsOneWidget);
  });

  testWidgets('Sprawdzenie walidacji pola Imię', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: RegisterFragment()));

    // Kliknięcie przycisku rejestracji bez wpisywania danych
    await tester.tap(find.widgetWithText(ElevatedButton, 'Rejestruj'));
    await tester.pump();

    // Sprawdź, czy pojawiła się walidacja dla pola "Imię"
    expect(find.text('Proszę wprowadzić Imię'), findsOneWidget);
  });
}
