import 'dart:convert';

PagarCuotaResponse bannerResponseFromJson(String str) =>
    PagarCuotaResponse.fromJson(json.decode(str));

String bannerResponseToJson(PagarCuotaResponse data) =>
    json.encode(data.toJson());

class PagarCuotaResponse {
  final String codigo;
  final String mensaje;
  final String idcuota;

  PagarCuotaResponse({
    required this.codigo,
    required this.mensaje,
    required this.idcuota,
  });

  PagarCuotaResponse copyWith({
    String? codigo,
    String? mensaje,
  }) =>
      PagarCuotaResponse(
        codigo: codigo ?? this.codigo,
        mensaje: mensaje ?? this.mensaje,
        idcuota: idcuota ?? this.idcuota,
      );

  factory PagarCuotaResponse.fromJson(Map<String, dynamic> json) =>
      PagarCuotaResponse(
        codigo: json["codigo"] ?? "",
        mensaje: json["mensaje"] ?? "",
        idcuota: json["idcuota"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "mensaje": mensaje,
        "idcuota": idcuota,
      };
}
