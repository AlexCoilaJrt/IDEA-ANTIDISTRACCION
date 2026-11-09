import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app_flows.dart';

void main() {
  setUpAll(() => initializeDateFormatting('es'));

  testWidgets('bienvenida, permisos y apps permitidas', onboardingFlow);
  testWidgets('salida con costo en tres escalones', earlyExitFlow);
  testWidgets('sesión completada actualiza la racha', completedFlow);
}
