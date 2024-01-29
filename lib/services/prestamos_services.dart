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

  Future<List<PrestamosModel>> getPrestamosaVencer() async {
    try {
      // final usuario = await storage.read(key: "usuario");
      // dio.dio.options.headers = {
      //   'emisor': usuario,
      // };
      final resp = await dio.dio.get('/listarprestamosavencer');
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

  Future<List<PrestamosModel>> getPrestamosaVencidos() async {
    try {
      // final usuario = await storage.read(key: "usuario");
      // dio.dio.options.headers = {
      //   'emisor': usuario,
      // };
      final resp = await dio.dio.get('/listarprestamosvencidos');
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

  Future<List<PrestamosModel>> getPrestamosaFinalizado() async {
    try {
      // final usuario = await storage.read(key: "usuario");
      // dio.dio.options.headers = {
      //   'emisor': usuario,
      // };
      final resp = await dio.dio.get('/listarprestamofinalizado');
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

  Future<String> simularCredito(int valor, int interes, int cuotas,
      String tipoPago, String tipoInteres, String fecha) async {
    try {
      print(valor);
      final resp = await dio.dio.post('/simulador', data: {'valor': 1});
      print(resp);
      return "";
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
}
