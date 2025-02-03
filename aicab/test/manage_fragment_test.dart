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

  /*group('ManageFragment Widget Tests', () {

    testWidgets('Zmiana stanu przełącznika "W użyciu" i potwierdzenie', (WidgetTester tester) async {
      
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      await tester.getCenter(find.byType(SingleChildScrollView));
      await tester.pumpAndSettle();

      //expect(find.text("W użyciu:"), findsOneWidget);

      final Finder toggleFinder = find.byType(Switch);
      expect(toggleFinder, findsOneWidget);
      await tester.tap(toggleFinder);
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(TextButton, "Ok"));
      await tester.pumpAndSettle();

    });

    

  });*/

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
