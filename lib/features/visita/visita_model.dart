import 'package:equatable/equatable.dart';
import 'package:residente_app/features/visita/tipo_visita_model.dart';

class VisitaFrecuenteModel extends Equatable {
  final String nombre;
  final String notas;
  final TipoVisitaModel tipoVisita;

  const VisitaFrecuenteModel(
      {required this.nombre, required this.notas, required this.tipoVisita});

  factory VisitaFrecuenteModel.fromJson(Map<String, dynamic> json) =>
      VisitaFrecuenteModel(
          nombre: json["nombre"],
          notas: json["notas"],
          tipoVisita: TipoVisitaModel.fromJson(json["tipovisita"]));

  @override
  List<Object?> get props => [nombre, notas, tipoVisita];
}
