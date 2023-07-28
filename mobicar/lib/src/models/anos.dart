import 'dart:convert';

class Anos {
  final String codigo;
  final String nome;

  Anos({
    required this.codigo,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'nome': nome,
    };
  }

  factory Anos.fromMap(Map<String, dynamic> map) {
    return Anos(
      codigo: map['codigo'] as String,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Anos.fromJson(String source) =>
      Anos.fromMap(json.decode(source) as Map<String, dynamic>);
}
