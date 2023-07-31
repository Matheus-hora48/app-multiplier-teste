
import 'package:mobicar/src/models/model_anos.dart';
import 'package:mobicar/src/models/modelos.dart';

import '../models/marcas.dart';

class Carro {
  final int? id;
  final Marcas marca;
  final Modelos modelo;
  final Anos ano;
  final String valor;
  final String combustivel;

  Carro({
    this.id,
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.valor,
    required this.combustivel,
  });
}
