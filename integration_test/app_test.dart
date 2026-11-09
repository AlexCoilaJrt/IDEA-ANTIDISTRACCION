// Flujo de sesión sobre un celular o emulador:
// flutter test integration_test --flavor local
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../test/flows/app_flows.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => initializeDateFormatting('es'));

  testWidgets('bienvenida, permisos y apps permitidas', onboardingFlow);
  testWidgets('asistente de permisos paso a paso', permissionsWizardFlow);
  testWidgets('salida con costo en tres escalones', earlyExitFlow);
  testWidgets('descanso largo después del bloque 4', longBreakFlow);
  testWidgets('sesión completada actualiza la racha', completedFlow);
}
