import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:residente_app/core/utils/constants.dart';
import 'package:residente_app/features/visita/tipo_visita_model.dart';
import 'package:residente_app/features/visita/visita_model.dart';

abstract class VisitaDataSource {
  Future<List<VisitaFrecuenteModel>> getVisitasFrecuentes();
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
      List<VisitaFrecuenteModel> encuestas = List<VisitaFrecuenteModel>.from(
          iterable.map((e) => VisitaFrecuenteModel.fromJson(e)));
      return encuestas;
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
}
