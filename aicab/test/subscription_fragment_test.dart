import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:aicab/fragment/SubFragment.dart';
import 'package:aicab/model/UserModel.dart';
import 'package:aicab/utils/DataExamples.dart';

void main() {
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: SubFragment(),
    );
  }

  group('SubFragment Widget Tests', () {
    /*testWidgets('Walidacja formularza – puste pola', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final subButton = find.widgetWithText(ElevatedButton, "Zakup subskrypcję");
      expect(subButton, findsOneWidget);
      await tester.tap(subButton);
      await tester.pumpAndSettle();

      expect(find.text("Proszę wprowadzić Imię"), findsOneWidget);
      expect(find.text("Proszę wprowadzić Nazwisko"), findsOneWidget);
      expect(find.text("Proszę wprowadzić Adres email"), findsOneWidget);
      expect(find.text("Proszę wprowadzić Numer telefonu"), findsOneWidget);
      expect(find.text("Proszę wprowadzić Nazwa firmy"), findsOneWidget);
      expect(find.text("Proszę wprowadzić NIP"), findsOneWidget);
      expect(find.text("Proszę wprowadzić Adres firmy"), findsOneWidget);
    });*/

    testWidgets('Sprawdzenie poprawnego zakupu subskrypcji firmowej', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await tester.enterText(find.widgetWithText(TextFormField, "Imię"), "Jan");
      await tester.enterText(find.widgetWithText(TextFormField, "Nazwisko"), "Kowalski");

      final existingEmail = getUsers().first.email;
      await tester.enterText(find.widgetWithText(TextFormField, "Adres email"), existingEmail);
      await tester.enterText(find.widgetWithText(TextFormField, "Numer telefonu"), "123456789");
      await tester.enterText(find.widgetWithText(TextFormField, "Nazwa firmy"), "Filmex");
      await tester.enterText(find.widgetWithText(TextFormField, "NIP"), "12345678912");
      await tester.enterText(find.widgetWithText(TextFormField, "Adres firmy"), "Malinowa 12, Ustroń 43-450");

      await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -300));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(CheckboxListTile));
      await tester.pumpAndSettle();
      

      await tester.tap(find.widgetWithText(ElevatedButton, "Zakup subskrypcję"));
      await tester.pumpAndSettle();

      expect(find.text("Subskrypcja została pomyślnie zakupiona!"), findsOneWidget);

      await tester.tap(find.widgetWithText(TextButton, "Ok"));
      await tester.pumpAndSettle();
    });

    testWidgets('Sprawdzenie zachowania systemu przy błędnych danych wejściowych', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await tester.enterText(find.widgetWithText(TextFormField, "Imię"), "Jan");
      await tester.enterText(find.widgetWithText(TextFormField, "Nazwisko"), "Kowalski");

      final existingEmail = getUsers().first.email;
      await tester.enterText(find.widgetWithText(TextFormField, "Adres email"), existingEmail);
      await tester.enterText(find.widgetWithText(TextFormField, "Numer telefonu"), "123456789");
      await tester.enterText(find.widgetWithText(TextFormField, "Nazwa firmy"), "Filmex");
      await tester.enterText(find.widgetWithText(TextFormField, "NIP"), "12345678912");
      await tester.enterText(find.widgetWithText(TextFormField, "Adres firmy"), "Malinowa 12, Ustroń 43-450");
      
      await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -300));
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(ElevatedButton, "Zakup subskrypcję"));
      await tester.pumpAndSettle();

      expect(find.text("Musisz zaakceptować regulamin."), findsOneWidget);

      await tester.tap(find.widgetWithText(TextButton, "OK"));
      await tester.pumpAndSettle();
    });

    

  });

  group('SubFragment Unit Tests', () {
    test('validatePhoneNumber zwraca true dla poprawnego numeru telefonu (9 cyfr)', () {
      const String validPhoneNumber = "123456789";

      final bool isValid = validatePhoneNumber(validPhoneNumber);

      expect(isValid, isTrue);
    });

    test('validatePhoneNumber zwraca false dla numeru telefonu o długości innej niż 9 cyfr', () {
      const String invalidPhoneNumber1 = "12345";
      const String invalidPhoneNumber2 = "1234567890";

      expect(validatePhoneNumber(invalidPhoneNumber1), isFalse);
      expect(validatePhoneNumber(invalidPhoneNumber2), isFalse);
    });


    test('validateNipNumber zwraca true dla poprawnego numeru nip (11 cyfr)', () {
      const String validNipNumber = "12345678912";

      final bool isValid = validateNipNumber(validNipNumber);

      expect(isValid, isTrue);
    });


    test('validateNipNumber zwraca false dla numeru nip o długości innej niż 11 cyfr', () {
      const String invalidNipNumber1 = "12345";
      const String invalidNipNumber2 = "1234567890";

      expect(validateNipNumber(invalidNipNumber1), isFalse);
      expect(validateNipNumber(invalidNipNumber2), isFalse);
    });


  });
}
