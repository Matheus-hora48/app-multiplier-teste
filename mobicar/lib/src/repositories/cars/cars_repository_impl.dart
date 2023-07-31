import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobicar/src/dto/carro.dart';
import 'package:mobicar/src/dto/dto_interface.dart';

import '../../core/database/database_config.dart';
import '../../core/exceptions/repository_exceptions.dart';
import '../../models/valor.dart';
import 'cars_repository.dart';
import '../../models/model_anos.dart';
import '../../models/marcas.dart';
import '../../models/modelos.dart';

class CarsRepositoryImpl implements CarsRepository {
  final DtoInterface dtoInnerBank;

  final String baseUrl = 'https://parallelum.com.br/fipe/api/v1';
  static const _tableName = 'cars';

  CarsRepositoryImpl(this.dtoInnerBank);

  Dio dio = Dio();

  @override
  Future<List<Marcas>> findBrand() async {
    try {
      final brandResponse = await dio.get(
        "$baseUrl/carros/marcas",
      );
      if (brandResponse.data is List) {
        return brandResponse.data
            .map<Marcas>((o) => Marcas.fromMap(o))
            .toList();
      }
      return [];
    } catch (e, s) {
      log(
        'Erro ao buscar as marcas',
        error: e,
        stackTrace: s,
      );
      throw RepositoryExceptions(
        message: 'Erro ao buscar as marcas',
      );
    }
  }

  @override
  Future<List<Modelos>> findModel(String brandId) async {
    try {
      final modelResponse = await dio.get(
        "$baseUrl/carros/marcas/$brandId/modelos",
      );

      if (modelResponse.data['modelos'] is List) {
        return modelResponse.data['modelos']
            .map<Modelos>((o) => Modelos.fromMap(o))
            .toList();
      }
      return [];
    } catch (e, s) {
      log(
        'Erro ao buscar os modelos',
        error: e,
        stackTrace: s,
      );
      throw RepositoryExceptions(
        message: 'Erro ao buscar os modelos',
      );
    }
  }

  @override
  Future<List<Anos>> findYear(String brandId, String modelId) async {
    try {
      final yearResponse = await dio.get(
        "$baseUrl/carros/marcas/$brandId/modelos/$modelId/anos",
      );
      return (yearResponse.data as List)
          .map<Anos>((o) => Anos.fromMap(o))
          .toList();
    } catch (e, s) {
      log(
        'Erro ao buscar as datas',
        error: e,
        stackTrace: s,
      );
      throw RepositoryExceptions(
        message: 'Erro ao buscar as datas',
      );
    }
  }

  @override
  Future<Valor> findValue(String brandId, String modelId, String yearId) async {
    try {
      final valueResponse = await dio.get(
        "$baseUrl/carros/marcas/$brandId/modelos/$modelId/anos/$yearId",
      );
      return Valor.fromMap(valueResponse.data);
    } catch (e, s) {
      log(
        'Erro ao buscar os valores',
        error: e,
        stackTrace: s,
      );
      throw RepositoryExceptions(
        message: 'Erro ao buscar os valores',
      );
    }
  }

  @override
  Future<bool> deleteCars(String id) async {
    final db = await DatabaseCars().db;

    final result = await db.delete(_tableName, where: 'id=?', whereArgs: [id]);
    return result == 1 ? true : false;
  }

  @override
  Future<Carro?> editCars(Carro car) async {
    final db = await DatabaseCars().db;

    Carro objCar = Carro(
      id: car.id,
      marca: car.marca,
      modelo: car.modelo,
      ano: car.ano,
      valor: car.valor,
    );

    final id = await db.update(
      _tableName,
      dtoInnerBank.toMapInternalDatabase(objCar),
    );

    if (id == 0) return null;
    return objCar;
  }

  @override
  Future<int?> insertCars(Carro car) async {
    final db = await DatabaseCars().db;

    Carro objCar = Carro(
      id: car.id,
      marca: car.marca,
      modelo: car.modelo,
      ano: car.ano,
      valor: dtoInnerBank.parseMoney(car.valor).toString(),
    );

    final id = await db.insert(
      _tableName,
      dtoInnerBank.toMapInternalDatabase(objCar),
    );

    if (id == 0) return null;
    return id;
  }

  @override
  Future<List<Carro>> selectCars() async {
    final db = await DatabaseCars().db;
    final result = await db.query(_tableName);
    return result.map((map) => dtoInnerBank.fromInternalDatabase(map)).toList();
  }
}
