// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:mobicar/src/models/model_anos.dart';
import 'package:mobicar/src/models/modelos.dart';

import '../models/marcas.dart';

class Carro {
  final int? id;
  final Marcas marca;
  final Modelos modelo;
  final Anos ano;
  final String valor;

  Carro({
    this.id,
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.valor,
  });

  @override
  String toString() {
    return 'Carro(id: $id, marca: $marca, modelo: $modelo, ano: $ano, valor: $valor)';
  }
}
