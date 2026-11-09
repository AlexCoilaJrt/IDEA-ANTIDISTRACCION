import 'package:enfoque/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

/// Entornos. Solo `local` se usa por ahora (sin servicios externos).
enum Flavor { local, dev, prod }

Future<void> bootstrap(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es');
  // F3: aquí se conectará Firebase a los emuladores en el flavor `local`.
  runApp(const ProviderScope(child: EnfoqueApp()));
}
