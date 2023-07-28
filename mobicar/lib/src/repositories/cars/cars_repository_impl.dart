import 'dart:developer';

import '../../core/exceptions/repository_exceptions.dart';
import '../../core/rest_client/http_manager.dart';
import '../../models/valor.dart';
import 'cars_repository.dart';
import '../../models/model_anos.dart';
import '../../models/marcas.dart';
import '../../models/modelos.dart';

class CarsRepositoryImpl implements CarsRepository {
  final HttpManager _httpManager = HttpManager();
  final String baseUrl = 'https://parallelum.com.br/fipe/api/v1';

  @override
  Future<List<Marcas>> findBrand() async {
    try {
      final brandResponse = await _httpManager.restRequest(
        url: "$baseUrl/carros/marcas",
        method: HttpMethods.get,
      );
      if (brandResponse is List) {
        return brandResponse.map<Marcas>((o) => Marcas.fromMap(o)).toList();
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
      final modelResponse = await _httpManager.restRequest(
        url: "$baseUrl/carros/marcas/$brandId/modelos",
        method: HttpMethods.get,
      );

      if (modelResponse['modelos'] is List) {
        return modelResponse['modelos']
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
      final yearResponse = await _httpManager.restRequest(
        url: "$baseUrl/carros/marcas/$brandId/modelos/$modelId/anos",
        method: HttpMethods.get,
      );
      return (yearResponse as List).map<Anos>((o) => Anos.fromMap(o)).toList();
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
      final valueResponse = await _httpManager.restRequest(
        url: "$baseUrl/marcas/$brandId/modelos/$modelId/anos/$yearId",
        method: HttpMethods.get,
      );
      return Valor.fromMap(
          valueResponse); // Supondo que Valor possui um construtor fromMap que recebe um Map<String, dynamic>.
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
}
