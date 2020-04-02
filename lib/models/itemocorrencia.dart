import 'package:flutter/rendering.dart';

class ItemOcorrencia {
  int id;
  String titulo;
  String textodaocorrencia;
  String tipo;

  ItemOcorrencia(this.id, this.titulo, this.textodaocorrencia, this.tipo);

  ItemOcorrencia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    textodaocorrencia = json['textodaocorrencia'];
    tipo = json['tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['textodaocorrencia'] = this.textodaocorrencia;
    data['tipo'] = this.tipo;
    return data;
  }

  @override
  String toString() {
    return 'ItemOcorrencia{id: $id, tipo: $tipo, titulo:$titulo, textodaocorrencia: $textodaocorrencia}';
  }
}
