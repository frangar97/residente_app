class ReservacionModel {
  ReservacionModel({
    required this.id,
    required this.username,
    required this.fecha,
    required this.lugar,
    required this.descripcion,
  });

  final int id;
  final String username;
  final String fecha;
  final String lugar;
  final String descripcion;

  factory ReservacionModel.fromJson(Map<String, dynamic> json) =>
      ReservacionModel(
        id: json["id"],
        username: json["username"],
        fecha: json["fecha"],
        lugar: json["lugar"],
        descripcion: json["descripcion"],
      );
}
