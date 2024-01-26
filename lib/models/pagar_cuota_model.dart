import 'dart:convert';

PagarCuotaResponse bannerResponseFromJson(String str) =>
    PagarCuotaResponse.fromJson(json.decode(str));

String bannerResponseToJson(PagarCuotaResponse data) =>
    json.encode(data.toJson());

class PagarCuotaResponse {
  final String codigo;
  final String mensaje;

  PagarCuotaResponse({
    required this.codigo,
    required this.mensaje,
  });

  PagarCuotaResponse copyWith({
    String? codigo,
    String? mensaje,
  }) =>
      PagarCuotaResponse(
        codigo: codigo ?? this.codigo,
        mensaje: mensaje ?? this.mensaje,
      );

  factory PagarCuotaResponse.fromJson(Map<String, dynamic> json) =>
      PagarCuotaResponse(
        codigo: json["codigo"] ?? "",
        mensaje: json["mensaje"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "mensaje": mensaje,
      };
}
