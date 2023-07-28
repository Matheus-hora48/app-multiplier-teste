import 'dart:ffi';

class Carro {
  final String marcas;
  final String modelos;
  final Int anoModelo;
  final String valor;
  final String combustivel;

  Carro({
    required this.valor,
    required this.marcas,
    required this.modelos,
    required this.anoModelo,
    required this.combustivel,
  });
}
