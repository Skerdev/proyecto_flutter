import 'package:flutter_test/flutter_test.dart';

import 'package:activate_app/main.dart';

void main() {
  testWidgets('La app inicia en login de Fit Colombia', (WidgetTester tester) async {
    await tester.pumpWidget(const FitColombiaApp());

    expect(find.text('FIT COLOMBIA'), findsOneWidget);
    expect(find.text('Inicia sesión'), findsOneWidget);
    expect(find.text('Entrar'), findsOneWidget);
  });
}