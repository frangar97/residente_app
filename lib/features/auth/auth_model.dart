import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  final String name;
  final int tipoUsuarioId;

  const AuthModel({required this.name, required this.tipoUsuarioId});

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      AuthModel(name: json["name"], tipoUsuarioId: json["tipo_usuario_id"]);

  @override
  List<Object?> get props => [name, tipoUsuarioId];
}
