import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:aicab/screen/MapScreen.dart';
import 'package:aicab/utils/DataExamples.dart';

void main() {
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: SizedBox(
        width: 500,
        height: 800,
        child: MapScreen(
          carName: "Test Car",
          price: 10.0,
          carImagePath: "images/arial atom 2.jpg",
        ),
      ),
    );
  }

  group('MapScreen Widget Tests', () {
    testWidgets('Początkowy stan MapScreen', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final imageFinder = find.byType(Image);
      expect(imageFinder, findsWidgets);

      expect(find.textContaining("0.00"), findsOneWidget);
    });

    testWidgets('Wybór trasy aktualizuje stan', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final gestureDetectorFinder = find.byKey(const Key('mapGestureDetector'));
      expect(gestureDetectorFinder, findsOneWidget);

      final Offset topLeftTap = const Offset(100, 100);
      await tester.tapAt(topLeftTap);
      await tester.pumpAndSettle();

      final routes = getAvailableRoutes();
      final expectedImage = routes[0].routeImage;
      final expectedPrice = (10.0 * routes[0].distance).toStringAsFixed(2);

      expect(find.byKey(const Key('calculatedPriceText')), findsOneWidget);
      expect(find.textContaining(expectedPrice), findsOneWidget);

      expect(find.byKey(const Key('mapImage')), findsOneWidget);
      final Image imageWidget = tester.widget(find.byKey(const Key('mapImage')));
      expect((imageWidget.image as AssetImage).assetName, equals(expectedImage));
    });

    testWidgets('Zatwierdzenie trasy bez wyboru wyświetla dialog błędu', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final confirmButton = find.widgetWithText(ElevatedButton, 'Zatwierdź');
      expect(confirmButton, findsOneWidget);
      await tester.ensureVisible(confirmButton);
      await tester.tap(confirmButton);
      await tester.pumpAndSettle();

      expect(find.textContaining("Nie wybrano żadnej trasy"), findsOneWidget);
      await tester.pumpAndSettle();
    });
  });
}
