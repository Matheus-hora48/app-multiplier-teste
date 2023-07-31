import 'dart:convert';

import 'package:mobicar/src/dto/carro.dart';

import '../models/marcas.dart';
import '../models/model_anos.dart';
import '../models/modelos.dart';
import 'dto_interface.dart';

class DtoInnerBank implements DtoInterface {
  @override
  Carro fromInternalDatabase(Map<String, dynamic> map) {
    return Carro(
      id: map['id'],
      marca: Marcas.fromJson(jsonDecode(map['marca'])),
      modelo: Modelos.fromJson(jsonDecode(map['modelo'])),
      ano: Anos.fromJson(jsonDecode(map['ano'])),
      valor: map['valor'],
    );
  }

  @override
  Map<String, dynamic> toMapInternalDatabase(Carro carro) {
    return {
      'id': carro.id,
      'marca': jsonEncode(carro.marca.toJson()),
      'modelo': jsonEncode(carro.modelo.toJson()),
      'ano': jsonEncode(carro.ano.toJson()),
      'valor': carro.valor,
    };
  }

  @override
  num parseMoney(String moneyValue) {
    final cleanedValue = moneyValue.replaceAll(RegExp(r'[^\d]'), '');
    return num.parse(cleanedValue) / 100;
  }
}
