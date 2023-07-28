import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobicar/src/core/rest_client/http_manager.dart';
import 'package:mobicar/src/models/marcas.dart';
import 'package:mobicar/src/repositories/cars/cars_repository_impl.dart';
import 'package:mockito/mockito.dart';

class MockHttpManager extends Mock implements HttpManager {}

void main() {
  const String baseUrl = 'https://parallelum.com.br/fipe/api/v1';

  final mockHttpManager = MockHttpManager();
  final repository = CarsRepositoryImpl();

  test('Test findBrand', () async {
    
    when(mockHttpManager.restRequest(
      url: "$baseUrl/carros/marcas",
      method: HttpMethods.get,
    )).thenAnswer((_) => Response(requestOptions: requestOptions));

    expect(brands, [Marcas(codigo: '1', nome: "Acura")]);
  });
}
