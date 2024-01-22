import 'package:dio/dio.dart';

class DbConexion {
  final Dio dio;
  DbConexion()
      : dio = Dio(BaseOptions(baseUrl: "https://apitask.grupof23.com/public/"));
}
