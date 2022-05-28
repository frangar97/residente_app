import 'package:equatable/equatable.dart';

class IncidenteModel extends Equatable {
  final int id;
  final String titulo;
  final String descripcion;
  final String lugar;
  final String fecha;

  const IncidenteModel(
      {required this.id,
      required this.descripcion,
      required this.lugar,
      required this.fecha,
      required this.titulo});

  factory IncidenteModel.fromJson(Map<String, dynamic> json) => IncidenteModel(
      id: json["id"],
      descripcion: json["descripcion"],
      lugar: json["lugar"],
      fecha: json["fecha"],
      titulo: json["titulo"]);

  @override
  List<Object?> get props => [id, descripcion, lugar, fecha];
}
