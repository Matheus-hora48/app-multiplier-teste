import '../../dto/anos.dart';
import '../../dto/carro.dart';
import '../../dto/marcas.dart';
import '../../dto/modelos.dart';

abstract class CarsRepository {
  Future<List<Marcas>> findBrand(String vehicleType);
  Future<List<Modelos>> findModel(String vehicleType, String brandId);
  Future<List<Anos>> findYear(
    String vehicleType,
    String brandId,
    String modelId,
  );
  Future<Carro> findCar(
    String vehicleType,
    String brandId,
    String modelId,
    String yearId,
  );
}
