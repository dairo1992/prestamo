import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:prestamo/models/login_model.dart';
import 'package:prestamo/services/login_services.dart';

class LoginProvider extends StateNotifier<List<LoginResponse>> {
  LoginProvider() : super([]);
  final peticion = LoginService();
  bool isLoading = false;

  Future<LoginResponse?> login(String usu, String pass) async {
    final usuario = await peticion.postLogin(usu, pass);
    if (usuario != null) {
      state = [...state, usuario];
      isLoading = false;
      return (usuario);
    }
    isLoading = false;
    return (null);
  }

  Future<LoginResponse?> registrarse(String usu, String pass) async {
    final usuario = await peticion.crearUsuario(usu, pass);
    if (usuario != null) {
      state = [...state, usuario];
      isLoading = false;
      return (usuario);
    }
    isLoading = false;
    return (null);
  }
}

final loginProviderpeticiones =
    StateNotifierProvider<LoginProvider, List<LoginResponse>>((ref) {
  return LoginProvider();
});

final tokenProvider = FutureProvider.autoDispose<String?>((ref) async {
  final storage = FlutterSecureStorage();
  final token = await storage.read(key: "token");
  return token;
});
