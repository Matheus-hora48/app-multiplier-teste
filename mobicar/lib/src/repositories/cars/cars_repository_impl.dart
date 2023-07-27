import 'dart:developer';

import '../../core/rest_client/custom_dio.dart';
import 'cars_repository.dart';
import '../../dto/anos.dart';
import '../../dto/carro.dart';
import '../../dto/marcas.dart';
import '../../dto/modelos.dart';

class CarsRepositoryImpl implements CarsRepository {
  final CustomDio _dio;

  CarsRepositoryImpl(this._dio);

  @override
  Future<List<Marcas>> findBrand(String vehicleType) async {
    try {
      await _dio.
    } catch (e, s) {
      log(
        'Erro ao buscar ',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<Carro> findCar(
      String vehicleType, String brandId, String modelId, String yearId) {
    // TODO: implement findCar
    throw UnimplementedError();
  }

  @override
  Future<List<Modelos>> findModel(String vehicleType, String brandId) {
    // TODO: implement findModel
    throw UnimplementedError();
  }

  @override
  Future<List<Anos>> findYear(
      String vehicleType, String brandId, String modelId) {
    // TODO: implement findYear
    throw UnimplementedError();
  }
}
