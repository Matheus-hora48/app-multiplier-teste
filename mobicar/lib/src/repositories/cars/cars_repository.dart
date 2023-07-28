import '../../models/model_anos.dart';
import '../../models/marcas.dart';
import '../../models/modelos.dart';
import '../../models/valor.dart';

abstract class CarsRepository {
  Future<List<Marcas>> findBrand();
  Future<List<Modelos>> findModel(String brandId);
  Future<List<Anos>> findYear(
    String brandId,
    String modelId,
  );
  Future<Valor> findValue(
    String brandId,
    String modelId,
    String yearId,
  );
}
