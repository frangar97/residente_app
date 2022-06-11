import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:residente_app/core/error/exceptions.dart';
import 'package:residente_app/core/utils/constants.dart';
import 'package:residente_app/features/auth/auth_model.dart';

abstract class AuthDataSource {
  Future<AuthModel> login(String email, String password);
}

class AuthDataSourceImpl implements AuthDataSource {
  final http.Client client;

  AuthDataSourceImpl({required this.client});

  @override
  Future<AuthModel> login(String email, String password) async {
    final url = Uri.http(kBaseUrl, "/api/login");

    final req = await client.post(url,
        body: jsonEncode({"email": email, "password": password}),
        headers: {"Content-Type": "application/json"});

    if (req.statusCode == 201) {
      return AuthModel.fromJson(jsonDecode(req.body));
    }

    throw ServerException();
  }
}
