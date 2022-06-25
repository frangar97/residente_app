import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:residente_app/core/error/exceptions.dart';
import 'package:residente_app/core/utils/constants.dart';
import 'package:residente_app/features/reservacion/reservacion_model.dart';

abstract class ReservacionDataSource {
  Future<List<ReservacionModel>> getReservaciones();
  Future<ReservacionModel> createReservacion(
      String fecha, String titulo, String lugar, String descripcion);
}

class ReservacionDataSourceImpl implements ReservacionDataSource {
  final http.Client client;

  ReservacionDataSourceImpl({required this.client});

  @override
  Future<List<ReservacionModel>> getReservaciones() async {
    final url = Uri.http(kBaseUrl, "/api/reservacion");
    final request =
        await http.get(url, headers: {"Content-Type": "application/json"});

    if (request.statusCode == 200) {
      Iterable iterable = jsonDecode(request.body);
      List<ReservacionModel> reservaciones = List<ReservacionModel>.from(
          iterable.map((e) => ReservacionModel.fromJson(e)));
      return reservaciones;
    }

    return [];
  }

  @override
  Future<ReservacionModel> createReservacion(
      String fecha, String titulo, String lugar, String descripcion) async {
    final url = Uri.http(kBaseUrl, "/api/reservacion");
    final request = await http.post(url, body: {
      "username": titulo,
      "lugar": lugar,
      "descripcion": descripcion,
      "fecha": fecha
    });

    if (request.statusCode == 201) {
      final decoded = jsonDecode(request.body);
      return ReservacionModel.fromJson(decoded);
    }

    throw ServerException();
  }
}
