import 'package:flutter_modular/flutter_modular.dart';

import '../../dto/dto_inner_bank.dart';
import '../../dto/dto_interface.dart';
import '../../repositories/cars/cars_repository.dart';
import '../../repositories/cars/cars_repository_impl.dart';
import 'cars_controller.dart';
import 'cars_page.dart';

class CarsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<CarsRepository>((i) => CarsRepositoryImpl(i())),
        Bind.lazySingleton<DtoInterface>((i) => DtoInnerBank()),
        Bind.lazySingleton((i) => CarsController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const CarsPage(),
        ),
      ];
}
