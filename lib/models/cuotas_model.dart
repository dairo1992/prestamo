import 'dart:convert';

class CuotasModel {
  final int idprestamo;
  final int cuotaactual;
  final int pagocapital;
  final int pagointeres;
  final String fechapago;

  CuotasModel({
    required this.idprestamo,
    required this.cuotaactual,
    required this.pagocapital,
    required this.pagointeres,
    required this.fechapago,
  });

  factory CuotasModel.fromJson(String str) =>
      CuotasModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CuotasModel.fromMap(Map<String, dynamic> json) => CuotasModel(
        idprestamo: json["ID_PRESTAMO"],
        cuotaactual: json["CUOTA_ACTUAL"],
        pagocapital: json["PAGO_CAPITAL"],
        pagointeres: json["PAGO_INTERES"],
        fechapago: json["FECHA_PAGO"],
      );

  Map<String, dynamic> toMap() => {
        "ID_PRESTAMO": idprestamo,
        "CUOTA_ACTUAL": cuotaactual,
        "PAGO_CAPITAL": pagocapital,
        "PAGO_INTERES": pagointeres,
        "FECHA_PAGO": fechapago,
      };

  CuotasModel copy() => CuotasModel(
        idprestamo: idprestamo,
        cuotaactual: cuotaactual,
        pagocapital: pagocapital,
        pagointeres: pagointeres,
        fechapago: fechapago,
      );
}
