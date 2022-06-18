import 'package:equatable/equatable.dart';

class TipoVisitaModel extends Equatable {
  final int id;
  final String nombre;

  const TipoVisitaModel({required this.id, required this.nombre});

  factory TipoVisitaModel.fromJson(Map<String, dynamic> json) =>
      TipoVisitaModel(id: json["id"], nombre: json["nombre"]);

  @override
  List<Object?> get props => [id, nombre];
}
