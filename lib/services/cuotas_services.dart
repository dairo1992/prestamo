// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import 'package:prestamo/config/conexion.dart';
import 'package:prestamo/models/cuotas_model.dart';

class CuotasServices {
  final DbConexion dio;
  CuotasServices() : dio = DbConexion();
  // FlutterSecureStorage storage = FlutterSecureStorage();

  Future<List<CuotasModel>> postCuotas(int idprestamo) async {
    try {
      // final usuario = await storage.read(key: "usuario");
      // dio.dio.options.headers = {
      //   'emisor': usuario,
      // };
      final resp = await dio.dio.post('/listarcuotas', data: {
        "id_prestamo": idprestamo,
      });
      Iterable datos = jsonDecode(resp.data);
      final listacuotas =
          List<CuotasModel>.from(datos.map((e) => CuotasModel.fromMap(e)));
      return listacuotas;
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
