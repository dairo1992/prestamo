import 'package:dio/dio.dart';

class DbConexion {
  final Dio dio;
  DbConexion()
      : dio = Dio(
            BaseOptions(baseUrl: "http://192.168.52.54/apiprestamos/public/"));
}
