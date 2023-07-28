import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobicar/src/core/rest_client/http_manager.dart';
import 'package:mobicar/src/models/marcas.dart';
import 'package:mobicar/src/repositories/cars/cars_repository_impl.dart';
import 'package:mockito/mockito.dart';

class MockHttpManager extends Mock implements HttpManager {}

void main() {
  final mockHttpManager = MockHttpManager();
  final repository = CarsRepositoryImpl();

  final response = [
    {"codigo": "1", "nome": "Acura"}
  ];

  when(mockHttpManager.restRequest(
    url: "/carros/marcas",
    method: HttpMethods.get,
  )).thenReturn(Future.value(response as dynamic));

  test('Test findBrand', () async {
    final brands = await repository.findBrand();

    expect(brands, [Marcas(codigo: '1', nome: "Acura")]);
  });
}
