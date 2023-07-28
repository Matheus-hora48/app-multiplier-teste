import 'dart:convert';

class Marcas {
  final String codigo;
  final String nome;

  Marcas({
    required this.codigo,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'nome': nome,
    };
  }

  factory Marcas.fromMap(Map<String, dynamic> map) {
    return Marcas(
      codigo: map['codigo'] as String,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Marcas.fromJson(String source) =>
      Marcas.fromMap(json.decode(source) as Map<String, dynamic>);
}
