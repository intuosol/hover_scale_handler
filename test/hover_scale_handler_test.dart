import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hover_scale_handler/hover_scale_handler.dart';

void main() {
  group('HoverScaleHandler', () {
    testWidgets('renders child correctly', (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: HoverScaleHandler(
                onTap: () {},
                child: const Text('Test Widget'),
              ),
            ),
          ),
        ),
      );

      // Verify the widget renders correctly
      expect(find.text('Test Widget'), findsOneWidget);
      expect(find.byType(HoverScaleHandler), findsOneWidget);
    });

    testWidgets('passes properties correctly', (WidgetTester tester) async {
      void onTapHandler() {}

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: HoverScaleHandler(
                onTap: onTapHandler,
                tooltip: 'Test Tooltip',
                scaleOnHover: 1.2,
                animationDuration: const Duration(milliseconds: 200),
                enableFeedback: true,
                child: const Text('Test Widget'),
              ),
            ),
          ),
        ),
      );

      // Verify the properties are passed to the widget
      final HoverScaleHandler widget = tester.widget<HoverScaleHandler>(
        find.byType(HoverScaleHandler),
      );

      expect(widget.onTap, equals(onTapHandler));
      expect(widget.tooltip, equals('Test Tooltip'));
      expect(widget.scaleOnHover, equals(1.2));
      expect(
        widget.animationDuration,
        equals(const Duration(milliseconds: 200)),
      );
      expect(widget.enableFeedback, isTrue);
    });

    testWidgets('uses default values when not specified', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: HoverScaleHandler(
                onTap: () {},
                child: const Text('Test Widget'),
              ),
            ),
          ),
        ),
      );

      // Verify the default values
      final HoverScaleHandler widget = tester.widget<HoverScaleHandler>(
        find.byType(HoverScaleHandler),
      );

      expect(widget.tooltip, equals(''));
      expect(widget.scaleOnHover, equals(1.05));
      expect(widget.defaultScale, equals(1.0));
      expect(
        widget.animationDuration,
        equals(const Duration(milliseconds: 100)),
      );
      expect(
        widget.tooltipWaitDuration,
        equals(const Duration(milliseconds: 500)),
      );
      expect(widget.enableFeedback, isFalse);
    });
  });
}
