import 'package:equatable/equatable.dart';

class EncuestaModel extends Equatable {
  final int id;
  final String titulo;
  final String descripcion;
  final String link;
  final String fecha;

  const EncuestaModel(
      {required this.id,
      required this.titulo,
      required this.descripcion,
      required this.fecha,
      required this.link});

  factory EncuestaModel.fromJson(Map<String, dynamic> json) => EncuestaModel(
      id: json["id"],
      titulo: json["titulo"],
      descripcion: json["descripcion"],
      fecha: json["fecha"],
      link: json["link"]);

  @override
  List<Object?> get props => [id, titulo, descripcion, link, fecha];
}
