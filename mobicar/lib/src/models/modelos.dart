// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Modelos {
  final String codigo;
  final String nome;

  Modelos({
    required this.codigo,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'nome': nome,
    };
  }

  factory Modelos.fromMap(Map<String, dynamic> map) {
    return Modelos(
      codigo: map['codigo'] as String,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Modelos.fromJson(String source) => Modelos.fromMap(json.decode(source) as Map<String, dynamic>);
}
