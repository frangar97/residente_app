import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:residente_app/core/error/exceptions.dart';
import 'package:residente_app/core/utils/constants.dart';
import 'package:residente_app/features/comunicado/comunicado_model.dart';

abstract class ComunicadoDataSource {
  Future<List<ComunicadoModel>> getComunicados();
  Future<ComunicadoModel> createComunicado(
      String fecha, String titulo, String descripcion);
}

class ComunicadoDataSourceImpl implements ComunicadoDataSource {
  final http.Client client;

  ComunicadoDataSourceImpl({required this.client});

  @override
  Future<List<ComunicadoModel>> getComunicados() async {
    final url = Uri.http(kBaseUrl, "/api/comunicado");
    final request =
        await http.get(url, headers: {"Content-Type": "application/json"});

    if (request.statusCode == 200) {
      Iterable iterable = jsonDecode(request.body);
      List<ComunicadoModel> comunicados = List<ComunicadoModel>.from(
          iterable.map((e) => ComunicadoModel.fromJson(e)));
      return comunicados;
    }

    return [];
  }

  @override
  Future<ComunicadoModel> createComunicado(
      String fecha, String titulo, String descripcion) async {
    final url = Uri.http(kBaseUrl, "/api/comunicado");
    final request = await http.post(url,
        body: {"titulo": titulo, "descripcion": descripcion, "fecha": fecha});

    if (request.statusCode == 201) {
      final decoded = jsonDecode(request.body);
      return ComunicadoModel.fromJson(decoded);
    }

    throw ServerException();
  }
}
