// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import 'package:prestamo/config/conexion.dart';
import 'package:prestamo/models/prestamos_model.dart';

class PrestamosServices {
  final DbConexion dio;
  PrestamosServices() : dio = DbConexion();
  // FlutterSecureStorage storage = FlutterSecureStorage();

  Future<List<PrestamosModel>> getPrestamos() async {
    try {
      // final usuario = await storage.read(key: "usuario");
      // dio.dio.options.headers = {
      //   'emisor': usuario,
      // };
      final resp = await dio.dio.get('/listarprestamos');
      Iterable datos = jsonDecode(resp.data);
      final listaprestamos = List<PrestamosModel>.from(
          datos.map((e) => PrestamosModel.fromMap(e)));
      return listaprestamos;
    } catch (e) {
      String message = e.toString();
      if (message ==
          'DioException [bad response]: The request returned an invalid status code of 500.') {
        print('111111111111111111111111');
      }
      return [];
    }
  }
}
