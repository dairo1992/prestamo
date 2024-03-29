import 'dart:convert';

LoginResponse bannerResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String bannerResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final bool status;
  final String token;
  final String tipo;
  final String msg;
  final String usuario;
  final String nombre;

  LoginResponse({
    required this.status,
    required this.token,
    required this.tipo,
    required this.msg,
    required this.usuario,
    required this.nombre,
  });

  LoginResponse copyWith({
    bool? status,
    String? token,
    String? tipo,
    String? msg,
    String? usuario,
    String? nombre,
  }) =>
      LoginResponse(
        status: status ?? this.status,
        token: token ?? this.token,
        tipo: tipo ?? this.tipo,
        msg: msg ?? this.msg,
        usuario: usuario ?? this.usuario,
        nombre: nombre ?? this.nombre,
      );

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"] ?? false,
        msg: json["msg"] ?? "",
        token: json["token"] ?? "",
        tipo: json["tipo"] ?? "",
        usuario: json["usuario"] ?? "",
        nombre: json["nombre"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "token": token,
        "tipo": tipo,
        "usuario": usuario,
        "nombre": nombre,
      };
}
