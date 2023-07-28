import 'dart:convert';

class Valor {
  final int tipoVeiculo;
  final String valor;
  final String marca;
  final String modelo;
  final int anoModelo;
  final String combustivel;
  final String codigoFipe;
  final String mesReferencia;
  final String siglaCombustivel;

  Valor({
    required this.tipoVeiculo,
    required this.valor,
    required this.marca,
    required this.modelo,
    required this.anoModelo,
    required this.combustivel,
    required this.codigoFipe,
    required this.mesReferencia,
    required this.siglaCombustivel,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'TipoVeiculo': tipoVeiculo,
      'valor': valor,
      'marca': marca,
      'modelo': modelo,
      'anoModelo': anoModelo,
      'combustivel': combustivel,
      'codigoFipe': codigoFipe,
      'mesReferencia': mesReferencia,
      'siglaCombustivel': siglaCombustivel,
    };
  }

  factory Valor.fromMap(Map<String, dynamic> map) {
    return Valor(
      tipoVeiculo: map['TipoVeiculo'] as int,
      valor: map['valor'] as String,
      marca: map['marca'] as String,
      modelo: map['modelo'] as String,
      anoModelo: map['anoModelo'] as int,
      combustivel: map['combustivel'] as String,
      codigoFipe: map['codigoFipe'] as String,
      mesReferencia: map['mesReferencia'] as String,
      siglaCombustivel: map['siglaCombustivel'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Valor.fromJson(String source) =>
      Valor.fromMap(json.decode(source) as Map<String, dynamic>);
}
