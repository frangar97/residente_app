import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:residente_app/core/utils/constants.dart';
import 'package:residente_app/features/incidente/incidente_model.dart';

abstract class IncidenteDataSource {
  Future<List<IncidenteModel>> getIncidentes();
}

class IncidenteDataSourceImpl implements IncidenteDataSource {
  final http.Client client;

  IncidenteDataSourceImpl({required this.client});

  @override
  Future<List<IncidenteModel>> getIncidentes() async {
    final url = Uri.http(kBaseUrl, "/api/incidente");
    final request =
        await http.get(url, headers: {"Content-Type": "application/json"});

    if (request.statusCode == 200) {
      Iterable iterable = jsonDecode(request.body);
      List<IncidenteModel> incidente = List<IncidenteModel>.from(
          iterable.map((e) => IncidenteModel.fromJson(e)));
      return incidente;
    }

    return [];
  }
}
