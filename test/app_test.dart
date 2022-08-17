import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stock_scan/app.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Given App', () {
    testWidgets(
      'When it is pumped, Then one Scaffold is expected`',
      (tester) async {
        await tester.pumpWidget(const App());

        expect(find.byType(Scaffold), findsOneWidget);
      },
      skip: true,
    );
  });
}
