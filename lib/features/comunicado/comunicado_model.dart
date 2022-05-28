import 'package:equatable/equatable.dart';

class ComunicadoModel extends Equatable {
  final int id;
  final String descripcion;
  final String fecha;

  const ComunicadoModel(
      {required this.id, required this.descripcion, required this.fecha});

  factory ComunicadoModel.fromJson(Map<String, dynamic> json) =>
      ComunicadoModel(
          id: json["id"],
          descripcion: json["descripcion"],
          fecha: json["fecha"]);

  @override
  List<Object?> get props => [id, descripcion, fecha];
}
