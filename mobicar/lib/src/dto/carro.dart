import 'dart:ffi';

import 'package:mobicar/src/models/modelos.dart';

import '../models/marcas.dart';

class Carro {
  final Marcas marca;
  final Modelos modelo;
  final Int anoModelo;
  final String valor;
  final String combustivel;

  Carro({
    required this.valor,
    required this.marca,
    required this.modelo,
    required this.anoModelo,
    required this.combustivel,
  });
}
