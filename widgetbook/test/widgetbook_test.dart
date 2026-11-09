import 'package:enfoque_widgetbook/main.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('el catálogo arranca y lista los componentes', (tester) async {
    tester.view
      ..physicalSize = const Size(1600, 1000)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(const EnfoqueWidgetbook());
    await tester.pump(const Duration(milliseconds: 500));
    expect(tester.takeException(), isNull);
    expect(find.textContaining('FocusButton'), findsWidgets);
  });
}
