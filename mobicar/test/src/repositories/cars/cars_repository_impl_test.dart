import 'package:flutter_test/flutter_test.dart';
import 'package:mobicar/src/dto/dto_inner_bank.dart';
import 'package:mobicar/src/repositories/cars/cars_repository_impl.dart';

void main() {
  final dtoInnerBank = DtoInnerBank();
  final repository = CarsRepositoryImpl(dtoInnerBank);

  test('Test findBrand', () async {
    final brands = await repository.findBrand();
    expect(brands.first.nome, "Acura");
  });

  test('Test findModel', () async {
    final model = await repository.findModel('59');
    expect(model.first.nome, "AMAROK CD2.0 16V/S CD2.0 16V TDI 4x2 Die");
  });

  test('Test findYear', () async {
    final year = await repository.findYear('59', '5940');
    expect(year.first.nome, "2022 Diesel");
  });

  test('Test findValue', () async {
    final value = await repository.findValue('59', '5940', '2014-3');
    expect(value.valor, "R\$ 116.194,00");
  });
}
