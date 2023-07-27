import 'dart:ffi';

import 'marcas.dart';
import 'modelos.dart';

class Carro {
  final String valor;
  final Marcas marcas;
  final Modelos modelos;
  final Int anoModelo;
  final String combustivel;

  Carro({
    required this.valor,
    required this.marcas,
    required this.modelos,
    required this.anoModelo,
    required this.combustivel,
  });
}
