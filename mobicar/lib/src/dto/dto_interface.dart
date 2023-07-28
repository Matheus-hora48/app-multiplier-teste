import 'package:mobicar/src/dto/carro.dart';

abstract class DtoInterface {
  Future<List<Carro>> selectCars();
  Future<bool> deleteCars(String id);
  Future<Carro> editCars(Carro car);
  Carro fromInternalDatabase(Map<String, dynamic> map);
  Map<String, dynamic> toMapInternalDatabase(Carro carro);
}
