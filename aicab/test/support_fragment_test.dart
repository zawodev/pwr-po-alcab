import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:aicab/fragment/SupportFragment.dart';
import 'package:aicab/model/UserModel.dart';
import 'package:aicab/utils/DataExamples.dart';

void main() {
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: SupportFragment(),
    );
  }

  group('SupportFragment Widget Tests', () {

    testWidgets('Sprawdzenie walidacji formularza przy błędnie wprowadzonych danych ', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final existingEmail = getUsers().first.email;

      await tester.enterText(find.widgetWithText(TextFormField, "Adres email"), "asds@gmail.com");
      await tester.enterText(find.widgetWithText(TextFormField, "Opis problemu"), "Mam problem");
      
      final categoryDropdown = find.byType(DropdownButtonFormField<String>).first;
      await tester.tap(categoryDropdown);
      await tester.pumpAndSettle();

      final optionToSelect = find.text('Inne').last;
      await tester.tap(optionToSelect);
      await tester.pumpAndSettle();

      final categoryDropdown2 = find.byType(DropdownButtonFormField<String>).last;
      await tester.tap(categoryDropdown2);
      await tester.pumpAndSettle();

      final optionToSelect2 = find.text('Przejazd #12345').last;
      await tester.tap(optionToSelect2);
      await tester.pumpAndSettle();
      

      await tester.tap(find.widgetWithText(ElevatedButton, "Wyślij"));
      await tester.pumpAndSettle();

      expect(find.text("Adres email nie istnieje w bazie danych."), findsOneWidget);
    });

    testWidgets('Sprawdzenie poprawnego zgłoszenia problemu przez użytkownika', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final existingEmail = getUsers().first.email;

      await tester.enterText(find.widgetWithText(TextFormField, "Adres email"), existingEmail);
      await tester.enterText(find.widgetWithText(TextFormField, "Opis problemu"), "Mam problem");
      
      final categoryDropdown = find.byType(DropdownButtonFormField<String>).first;
      await tester.tap(categoryDropdown);
      await tester.pumpAndSettle();

      final optionToSelect = find.text('Inne').last;
      await tester.tap(optionToSelect);
      await tester.pumpAndSettle();

      final categoryDropdown2 = find.byType(DropdownButtonFormField<String>).last;
      await tester.tap(categoryDropdown2);
      await tester.pumpAndSettle();

      final optionToSelect2 = find.text('Przejazd #12345').last;
      await tester.tap(optionToSelect2);
      await tester.pumpAndSettle();
      

      await tester.tap(find.widgetWithText(ElevatedButton, "Wyślij"));
      await tester.pumpAndSettle();

      expect(find.text("Zgłoszenie przyjęte!"), findsOneWidget);


    });
  });

  group('SupportFragment Unit Tests', () {
    test('validateCategory zwraca true dla poprawnej kategorii', () {
      String category = "Inne";

      final bool isValid = validateCategory(category);

      expect(isValid, isTrue);
    });

    test('validateCategory zwraca true dla niepoprawnej kategorii', () {
      String category = "Losowa kategoria";

      final bool isValid = validateCategory(category);

      expect(isValid, isFalse);
    });

    test('validateOrder zwraca true dla poprawnej kategorii', () {
      String order = "Przejazd #12345";

      final bool isValid = validateOrder(order);

      expect(isValid, isTrue);
    });

    test('validateOrder zwraca true dla niepoprawnej kategorii', () {
      String order = "Przejazd #11111";

      final bool isValid = validateOrder(order);

      expect(isValid, isFalse);
    });

  });

}
