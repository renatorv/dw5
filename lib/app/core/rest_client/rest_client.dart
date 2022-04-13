import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class RestClient extends GetConnect {
  // final _backendBaseUrl = "http://dartweek.academiadoflutter.com.br";
  final _backendBaseUrl = "https://parseapi.back4app.com/functions";

  RestClient() {
    httpClient.baseUrl = _backendBaseUrl;
    httpClient.addRequestModifier((Request request) {
      request.headers['X-Parse-Application-Id'] = 'jkPPTJ6C7HlC9UZR6dzT6O8efswDiqJn7u00icDC';
      request.headers['X-Parse-REST-API-Key'] = 'P4GITccabjL7KpFdooXmEwAYFjpHDleJ781kinST';
      return request;
    });
  }
}

class RestClientException implements Exception {
  final int? code;
  final String message;
  RestClientException(
    this.message, {
    this.code,
  });

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}
