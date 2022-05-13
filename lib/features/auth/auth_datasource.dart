import 'package:http/http.dart' as http;
import 'package:residente_app/core/error/exceptions.dart';
import 'package:residente_app/core/utils/constants.dart';

abstract class AuthDataSource {
  Future<bool> login(String email, String password);
}

class AuthDataSourceImpl implements AuthDataSource {
  final http.Client client;

  AuthDataSourceImpl({required this.client});

  @override
  Future<bool> login(String email, String password) async {
    final url = Uri.http(kBaseUrl, "/api/login");

    final req =
        await client.post(url, body: {"email": email, "password": password});

    if (req.statusCode == 201) {
      return true;
    }

    throw ServerException();
  }
}
