import 'package:flutter_test/flutter_test.dart';

import 'package:activate_app/main.dart';

void main() {
  testWidgets('La app inicia en login y muestra formulario', (WidgetTester tester) async {
    await tester.pumpWidget(const ActivateApp());

    expect(find.text('Activate App'), findsOneWidget);
    expect(find.text('Inicia sesión'), findsOneWidget);
    expect(find.text('Entrar'), findsOneWidget);
  });
}
