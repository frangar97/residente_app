import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:residente_app/core/error/exceptions.dart';
import 'package:residente_app/core/utils/constants.dart';
import 'package:residente_app/features/visita/tipo_visita_model.dart';
import 'package:residente_app/features/visita/visita_model.dart';

abstract class VisitaDataSource {
  Future<List<VisitaFrecuenteModel>> getVisitasFrecuentes();
  Future<List<VisitaEventualModel>> getVisitasEventuales();
  Future<bool> crearVisitaFrecuente(
      String nombre, String nota, int tipoVisitaId, String fecha);
  Future<List<TipoVisitaModel>> getTiposVisita();
}

class VisitaDataSourceImpl implements VisitaDataSource {
  final http.Client client;

  VisitaDataSourceImpl({required this.client});

  @override
  Future<List<VisitaFrecuenteModel>> getVisitasFrecuentes() async {
    final url = Uri.http(kBaseUrl, "/api/visita-frecuente");
    final request =
        await http.get(url, headers: {"Content-Type": "application/json"});

    if (request.statusCode == 200) {
      Iterable iterable = jsonDecode(request.body);
      List<VisitaFrecuenteModel> visitasFrecuntes =
          List<VisitaFrecuenteModel>.from(
              iterable.map((e) => VisitaFrecuenteModel.fromJson(e)));
      return visitasFrecuntes;
    }

    return [];
  }

  @override
  Future<List<TipoVisitaModel>> getTiposVisita() async {
    final url = Uri.http(kBaseUrl, "/api/tipo-visita");
    final request =
        await http.get(url, headers: {"Content-Type": "application/json"});

    if (request.statusCode == 200) {
      Iterable iterable = jsonDecode(request.body);
      List<TipoVisitaModel> tipos = List<TipoVisitaModel>.from(
          iterable.map((e) => TipoVisitaModel.fromJson(e)));
      return tipos;
    }

    return [];
  }

  @override
  Future<bool> crearVisitaFrecuente(
      String nombre, String nota, int tipoVisitaId, String fecha) async {
    final url = Uri.http(kBaseUrl, "/api/visita-frecuente");
    final request = await http.post(url, body: {
      "nombre": nombre,
      "notas": nota,
      "tipo_visita_id": tipoVisitaId.toString(),
      "fecha": fecha
    });

    if (request.statusCode == 201) {
      return true;
    }

    throw ServerException();
  }

  @override
  Future<List<VisitaEventualModel>> getVisitasEventuales() async {
    final url = Uri.http(kBaseUrl, "/api/visita-eventual");
    final request =
        await http.get(url, headers: {"Content-Type": "application/json"});

    if (request.statusCode == 200) {
      Iterable iterable = jsonDecode(request.body);
      List<VisitaEventualModel> visitasEventual =
          List<VisitaEventualModel>.from(
              iterable.map((e) => VisitaEventualModel.fromJson(e)));
      return visitasEventual;
    }

    return [];
  }
}
