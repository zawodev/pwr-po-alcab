import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:aicab/fragment/RegisterFragment.dart';
import 'package:aicab/model/UserModel.dart';
import 'package:aicab/utils/DataExamples.dart';

void main() {
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: RegisterFragment(),
    );
  }

  group('RegisterFragment Widget Tests', () {
    testWidgets('Walidacja formularza – puste pola', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final registerButton = find.widgetWithText(ElevatedButton, "Rejestruj");
      expect(registerButton, findsOneWidget);
      await tester.tap(registerButton);
      await tester.pumpAndSettle();

      expect(find.text("Proszę wprowadzić Imię"), findsOneWidget);
      expect(find.text("Proszę wprowadzić Nazwisko"), findsOneWidget);
      expect(find.text("Proszę wprowadzić Adres email"), findsOneWidget);
      expect(find.text("Proszę wprowadzić Numer telefonu"), findsOneWidget);
      expect(find.text("Proszę wprowadzić Hasło"), findsOneWidget);
    });

    testWidgets('Rejestracja – adres email już istnieje', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await tester.enterText(find.widgetWithText(TextFormField, "Imię"), "Jan");
      await tester.enterText(find.widgetWithText(TextFormField, "Nazwisko"), "Kowalski");

      final existingEmail = getUsers().first.email;
      await tester.enterText(find.widgetWithText(TextFormField, "Adres email"), existingEmail);
      await tester.enterText(find.widgetWithText(TextFormField, "Numer telefonu"), "123456789");
      await tester.enterText(find.widgetWithText(TextFormField, "Hasło"), "password");

      await tester.tap(find.byType(CheckboxListTile));
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(ElevatedButton, "Rejestruj"));
      await tester.pumpAndSettle();

      expect(find.text("Adres email już istnieje w bazie danych."), findsOneWidget);

      await tester.tap(find.widgetWithText(TextButton, "OK"));
      await tester.pumpAndSettle();
    });

    testWidgets('Rejestracja – brak akceptacji regulaminu', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await tester.enterText(find.widgetWithText(TextFormField, "Imię"), "Anna");
      await tester.enterText(find.widgetWithText(TextFormField, "Nazwisko"), "Nowak");
      await tester.enterText(find.widgetWithText(TextFormField, "Adres email"), "anna.nowak@example.com");
      await tester.enterText(find.widgetWithText(TextFormField, "Numer telefonu"), "987654321");
      await tester.enterText(find.widgetWithText(TextFormField, "Hasło"), "secret");
      // nie zaznaczamy checkboxa akceptacji regulaminu

      await tester.tap(find.widgetWithText(ElevatedButton, "Rejestruj"));
      await tester.pumpAndSettle();

      expect(find.text("Musisz zaakceptować regulamin."), findsOneWidget);

      await tester.tap(find.widgetWithText(TextButton, "OK"));
      await tester.pumpAndSettle();
    });

    testWidgets('Pomyślna rejestracja – wyświetlenie dialogu sukcesu i reset pól', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      const testEmail = "new.user@example.com";

      await tester.enterText(find.widgetWithText(TextFormField, "Imię"), "New");
      await tester.enterText(find.widgetWithText(TextFormField, "Nazwisko"), "User");
      await tester.enterText(find.widgetWithText(TextFormField, "Adres email"), testEmail);
      await tester.enterText(find.widgetWithText(TextFormField, "Numer telefonu"), "123123123");
      await tester.enterText(find.widgetWithText(TextFormField, "Hasło"), "newpassword");

      await tester.tap(find.byType(CheckboxListTile));
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(ElevatedButton, "Rejestruj"));
      await tester.pumpAndSettle();

      expect(find.text("Konto zostało pomyślnie utworzone!"), findsOneWidget);

      await tester.tap(find.widgetWithText(TextButton, "Ok"));
      await tester.pumpAndSettle();

      expect(find.widgetWithText(TextFormField, "New"), findsNothing);
      expect(find.widgetWithText(TextFormField, "User"), findsNothing);
      expect(find.widgetWithText(TextFormField, testEmail), findsNothing);
    });
  });
}
