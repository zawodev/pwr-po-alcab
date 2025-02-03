import 'package:aicab/model/CarModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:aicab/fragment/ManageFragment.dart';
import 'package:aicab/model/UserModel.dart';
import 'package:aicab/utils/DataExamples.dart';
import 'package:aicab/component/CarRowWidget.dart';

void main() {
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: ManageFragment(),
    );
  }

  group('ManageFragment Widget Tests', () {

    testWidgets('Zmiana stanu przełącznika "W użyciu" i potwierdzenie', (WidgetTester tester) async {
      
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await tester.pump(const Duration(seconds: 1));
      expect(find.byType(CarRowWidget), findsWidgets, reason: "CarRowWidget should be present");

      await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -300));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(InkWell).first);
      await tester.pumpAndSettle();

      // Ensure the popout window appears
      expect(find.text("W użyciu"), findsOneWidget);

      // Locate the toggle switch and change its state
      final Finder toggleFinder = find.byType(Switch);
      expect(toggleFinder, findsOneWidget); // Ensure toggle exists before interacting
      await tester.tap(toggleFinder);
      await tester.pumpAndSettle();

      // Tap the "OK" button to confirm
      await tester.tap(find.widgetWithText(TextButton, "Ok"));
      await tester.pumpAndSettle();

    // Add assertions if needed to verify state changes
    });

    

  });

  group('ManageFragment Unit Tests', () {
    test('isCarAvailable zwraca true dla auta w użytku', () {
      CarModel car = CarModel(id: 1, name: "Honda Civic", year: 2006, price: 2.13, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", inUse: true, service: DateTime.now());

      final bool isValid = isCarAvailable(car);

      expect(isValid, isTrue);
    });

    test('isCarAvailable zwraca false dla auta niezdatnego do użytku', () {
      CarModel car = CarModel(id: 1, name: "Honda Civic", year: 2006, price: 2.13, img: 'images/civic_mini.png', img2: "images/civic2006_full.jpg", status: "pojazd w normie", inUse: false, service: DateTime.now());

      final bool isValid = isCarAvailable(car);

      expect(isValid, isFalse);
    });
  });
}
