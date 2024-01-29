import 'package:dio/dio.dart';

class DbConexion {
  final Dio dio;
  DbConexion()
      : dio = Dio(
            BaseOptions(baseUrl: "http://141.136.39.100/apiprestamos/public/"));
}
