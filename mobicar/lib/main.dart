import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'src/app_modele.dart';
import 'src/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
