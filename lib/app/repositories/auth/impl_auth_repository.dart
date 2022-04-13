import 'dart:developer';

import 'package:vakinha_burger_mobile/app/core/exceptions/user_notfound_exception.dart';
import 'package:vakinha_burger_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger_mobile/app/models/user_model.dart';

import './auth_repository.dart';

class ImplAuthRepository implements AuthRepository {
  final RestClient _restClient;

  ImplAuthRepository({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post('/register', {
      'name': name,
      'email': email,
      'password': password,
    });

    if (result.hasError) {
      var message = 'Erro ao registrar usuário';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }
      print(message);
      print(result.statusCode);

      throw RestClientException(message);
    }

    return login(email, password);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient.post('/login', {
      'email': email,
      'password': password,
    });

    if (result.hasError) {
      if (result.statusCode == 403) {
        log(
          'Usuário ou senha inválidos!',
          error: result.statusText,
          stackTrace: StackTrace.current,
        );
        throw UserNotfoundException();
      }
      log(
        'Erro ao autenticar usuário (${result.statusCode})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao autenticar usuário.');
    }
    return UserModel.fromMap(result.body);
  }
}