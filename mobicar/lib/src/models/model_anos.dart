import 'dart:convert';

class Anos {
  final String codigo;
  final String nome;
  final String anoSemHifen;

  Anos({
    required this.codigo,
    required this.nome,
    required this.anoSemHifen,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'nome': nome,
    };
  }

  factory Anos.fromMap(Map<String, dynamic> map) {
    final codigo = map['codigo'] as String;
    final partesCodigo = codigo.split('-');
    return Anos(
      codigo: map['codigo'] as String,
      nome: map['nome'] as String,
      anoSemHifen: partesCodigo[0],
    );
  }

  String toJson() => json.encode(toMap());

  factory Anos.fromJson(String source) =>
      Anos.fromMap(json.decode(source) as Map<String, dynamic>);
}
