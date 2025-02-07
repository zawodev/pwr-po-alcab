import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:aicab/fragment/PaymentFragment.dart';
import 'package:aicab/model/UserModel.dart';
import 'package:aicab/utils/DataExamples.dart';

void main() {
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: PaymentFragment(),
    );
  }

  group('PaymentFragment Widget Tests', () {
    testWidgets('Sprawdzenie poprawnej realizacji ręcznej płatności ', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final PaymentButton = find.text("PayPal");
      expect(PaymentButton, findsOneWidget);
      await tester.tap(PaymentButton);
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), "jankowalski@gmail.com");

      await tester.tap(find.widgetWithText(ElevatedButton, "Zapłać PayPalem"));
      await tester.pumpAndSettle();

    });

    
  });

  group('PaymentFragment Unit Tests', () {
    test('validateEmail zwraca true dla poprawnego emaila (zawiera znak @)', () {
      const String validEmail = "michal@gmail.com";

      final bool isValid = validateEmail(validEmail);

      expect(isValid, isTrue);
    });

    test('validateEmail zwraca false dla niepoprawnego emaila (nie zawiera znaku @)', () {
      const String invalidEmail = "michalgmail.com";

      final bool isValid = validateEmail(invalidEmail);

      expect(isValid, isFalse);
    });

    test('validateCardNumber zwraca true dla poprawnego numeru karty kredytowej', () {
      const String validCardNumber = "1234123412341234";

      final bool isValid = validateCardNumber(validCardNumber);

      expect(isValid, isTrue);
    });

    test('validateCardNumber zwraca true dla niepoprawnego numeru karty kredytowej', () {
      const String invalidCardNumber = "123";

      final bool isValid = validateCardNumber(invalidCardNumber);

      expect(isValid, isFalse);
    });


    test('validateCardExpiryDate zwraca true dla poprawnej daty', () {
      const String validDate = "07/25";

      final bool isValid = validateCardExpiryDate(validDate);

      expect(isValid, isTrue);
    });

    test('validateCardExpiryDate zwraca true dla niepoprawnej daty', () {
      const String invalidDate = "0828";

      final bool isValid = validateCardExpiryDate(invalidDate);

      expect(isValid, isFalse);
    });


  });

}
