import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app_flows.dart';

void main() {
  setUpAll(() => initializeDateFormatting('es'));

  testWidgets('bienvenida, permisos y apps permitidas', onboardingFlow);
  testWidgets('asistente de permisos paso a paso', permissionsWizardFlow);
  testWidgets('salida con costo en tres escalones', earlyExitFlow);
  testWidgets('descanso largo después del bloque 4', longBreakFlow);
  testWidgets('sesión completada actualiza la racha', completedFlow);
}
