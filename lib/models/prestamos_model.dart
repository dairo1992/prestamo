import 'dart:convert';

class PrestamosModel {
  final int id;
  final String documento;
  final String nombre;
  final int monto;
  final int tasaInteres;
  final int cuotas;
  final String fechaProximoPago;
  final String direccion;
  final String telefono;
  final String tipointeres;
  final String fechaprestamo;
  final String fechaultimacuota;
  final int totalpagado;
  final int idcuota;
  final int cuotapagar;

  PrestamosModel({
    required this.id,
    required this.documento,
    required this.nombre,
    required this.monto,
    required this.tasaInteres,
    required this.cuotas,
    required this.fechaProximoPago,
    required this.direccion,
    required this.telefono,
    required this.tipointeres,
    required this.fechaprestamo,
    required this.fechaultimacuota,
    required this.totalpagado,
    required this.idcuota,
    required this.cuotapagar,
  });

  factory PrestamosModel.fromJson(String str) =>
      PrestamosModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PrestamosModel.fromMap(Map<String, dynamic> json) => PrestamosModel(
        id: json["ID"],
        documento: json["DOCUMENTO"],
        nombre: json["NOMBRE"],
        monto: json["MONTO"],
        tasaInteres: json["TASA_INTERES"],
        cuotas: json["CUOTAS"],
        fechaProximoPago: json["FECHA_PROXIMO_PAGO"],
        direccion: json["DIRECCION"],
        telefono: json["TELEFONO"],
        tipointeres: json["TIPO_INTERES"],
        fechaprestamo: json["FECHA_PRESTAMO"],
        fechaultimacuota: json["FECHA_ULTIMA_CUOTA"],
        totalpagado: json["TOTALPAGADO"],
        idcuota: json["IDCUOTA"],
        cuotapagar: json["CUOTAPAGAR"],
      );

  Map<String, dynamic> toMap() => {
        "ID": id,
        "DOCUMENTO": documento,
        "NOMBRE": nombre,
        "MONTO": monto,
        "TASA_INTERES": tasaInteres,
        "CUOTAS": cuotas,
        "FECHA_PROXIMO_PAGO": fechaProximoPago,
        "DIRECCION": direccion,
        "TELEFONO": telefono,
        "TIPO_INTERES": tipointeres,
        "FECHA_PRESTAMO": fechaprestamo,
        "FECHA_ULTIMA_CUOTA": fechaultimacuota,
        "TOTALPAGADO": totalpagado,
        "IDCUOTA": idcuota,
        "CUOTAPAGAR": cuotapagar,
      };

  PrestamosModel copy() => PrestamosModel(
        id: id,
        documento: documento,
        nombre: nombre,
        monto: monto,
        tasaInteres: tasaInteres,
        cuotas: cuotas,
        fechaProximoPago: fechaProximoPago,
        direccion: direccion,
        telefono: telefono,
        tipointeres: tipointeres,
        fechaprestamo: fechaprestamo,
        fechaultimacuota: fechaultimacuota,
        totalpagado: totalpagado,
        idcuota: idcuota,
        cuotapagar: cuotapagar,
      );
}
