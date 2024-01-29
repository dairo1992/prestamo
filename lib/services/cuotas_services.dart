// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import 'package:prestamo/config/conexion.dart';
import 'package:prestamo/models/cuotas_model.dart';
import 'package:prestamo/models/pagar_cuota_model.dart';

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

  Future<PagarCuotaResponse?> postPagarCuota(int idPrestamo, int idcuota,
      String cuotacancelar, int tasaInteres, String? tipointeres) async {
    try {
      final resp = await dio.dio.post('/pagarcuota', data: {
        "idPrestamo": idPrestamo,
        "idcuota": idcuota,
        "cuotacancelar": cuotacancelar,
        "tasaInteres": tasaInteres,
        "tipointeres": tipointeres
      });
      final response = PagarCuotaResponse.fromJson(jsonDecode(resp.data));
      if (response.codigo == "0") {
        return (response);
      }
      return (response);
    } catch (e) {
      return PagarCuotaResponse(
          codigo: '2', mensaje: 'No se logro registrar el pago', idcuota: '0');
      // return (null);
    }
  }
}
