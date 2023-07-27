import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/cars/cars_repository.dart';
import '../../repositories/cars/cars_repository_impl.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<CarsRepository>((i) => CarsRepositoryImpl(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        ),
      ];
}