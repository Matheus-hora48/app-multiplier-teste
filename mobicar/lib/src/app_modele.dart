import 'package:flutter_modular/flutter_modular.dart';

import 'modules/cars/cars_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        ModuleRoute('/cars', module: CarsModule()),
      ];
}
