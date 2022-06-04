import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:residente_app/core/utils/constants.dart';
import 'package:residente_app/features/encuesta/encuesta_model.dart';

abstract class EncuestaDataSource {
  Future<List<EncuestaModel>> getEncuestas();
}

class EncuestaDataSourceImpl implements EncuestaDataSource {
  final http.Client client;

  EncuestaDataSourceImpl({required this.client});

  @override
  Future<List<EncuestaModel>> getEncuestas() async {
    final url = Uri.http(kBaseUrl, "/api/encuesta");
    final request =
        await http.get(url, headers: {"Content-Type": "application/json"});

    if (request.statusCode == 200) {
      Iterable iterable = jsonDecode(request.body);
      List<EncuestaModel> encuestas = List<EncuestaModel>.from(
          iterable.map((e) => EncuestaModel.fromJson(e)));
      return encuestas;
    }

    return [];
  }
}
