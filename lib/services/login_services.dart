import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:prestamo/config/conexion.dart';
import 'package:prestamo/models/login_model.dart';

class LoginService {
  final DbConexion dio;
  LoginService() : dio = DbConexion();

  Future<LoginResponse?> postLogin(String usuario, String password) async {
    const storage = FlutterSecureStorage();
    try {
      final resp = await dio.dio
          .post('/login', data: {"usuario": usuario, "password": password});
      final response = LoginResponse.fromJson(jsonDecode(resp.data));
      if (response.status) {
        await storage.write(key: "usuario", value: response.usuario);
        await storage.write(key: "token", value: response.token);
        return (response);
      }
      return (response);
    } catch (e) {
      return (null);
    }
  }

  Future<LoginResponse?> crearUsuario(String usuario, String password) async {
    try {
      final resp = await dio.dio.post('/usuarios/crear',
          data: {"usuario": usuario, "password": password});
      final response = LoginResponse.fromJson(jsonDecode(resp.data));
      if (response.status) {
        return (response);
      }
      return (response);
    } catch (e) {
      return (null);
    }
  }
}
