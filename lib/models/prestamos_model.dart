// import 'dart:convert';

// List<PrestamosModel> prestamosModelFromJson(String str) =>
//     List<PrestamosModel>.from(
//         json.decode(str).map((x) => PrestamosModel.fromJson(x)));

// String prestamosModelToJson(List<PrestamosModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class PrestamosModel {
//   final int id;
//   final String documento;
//   final String nombre;
//   final int monto;
//   final int tasaInteres;
//   final int cuotas;
//   final DateTime fechaProximoPago;

//   PrestamosModel({
//     required this.id,
//     required this.documento,
//     required this.nombre,
//     required this.monto,
//     required this.tasaInteres,
//     required this.cuotas,
//     required this.fechaProximoPago,
//   });

//   PrestamosModel copyWith({
//     int? id,
//     String? documento,
//     String? nombre,
//     int? monto,
//     int? tasaInteres,
//     int? cuotas,
//     DateTime? fechaProximoPago,
//   }) =>
//       PrestamosModel(
//         id: id ?? this.id,
//         documento: documento ?? this.documento,
//         nombre: nombre ?? this.nombre,
//         monto: monto ?? this.monto,
//         tasaInteres: tasaInteres ?? this.tasaInteres,
//         cuotas: cuotas ?? this.cuotas,
//         fechaProximoPago: fechaProximoPago ?? this.fechaProximoPago,
//       );

//   factory PrestamosModel.fromJson(Map<String, dynamic> json) => PrestamosModel(
//         id: json["ID"],
//         documento: json["DOCUMENTO"],
//         nombre: json["NOMBRE"],
//         monto: json["MONTO"],
//         tasaInteres: json["TASA_INTERES"],
//         cuotas: json["CUOTAS"],
//         fechaProximoPago: DateTime.parse(json["FECHA_PROXIMO_PAGO"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "ID": id,
//         "DOCUMENTO": documento,
//         "NOMBRE": nombre,
//         "MONTO": monto,
//         "TASA_INTERES": tasaInteres,
//         "CUOTAS": cuotas,
//         "FECHA_PROXIMO_PAGO":
//             "${fechaProximoPago.year.toString().padLeft(4, '0')}-${fechaProximoPago.month.toString().padLeft(2, '0')}-${fechaProximoPago.day.toString().padLeft(2, '0')}",
//       };
// }

import 'dart:convert';

class PrestamosModel {
  final int id;
  final String documento;
  final String nombre;
  final int monto;
  final int tasaInteres;
  final int cuotas;
  final String fechaProximoPago;

  PrestamosModel({
    required this.id,
    required this.documento,
    required this.nombre,
    required this.monto,
    required this.tasaInteres,
    required this.cuotas,
    required this.fechaProximoPago,
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
      );

  Map<String, dynamic> toMap() => {
        "ID": id,
        "DOCUMENTO": documento,
        "NOMBRE": nombre,
        "MONTO": monto,
        "TASA_INTERES": tasaInteres,
        "CUOTAS": cuotas,
        "FECHA_PROXIMO_PAGO": fechaProximoPago,
      };

  PrestamosModel copy() => PrestamosModel(
        id: id,
        documento: documento,
        nombre: nombre,
        monto: monto,
        tasaInteres: tasaInteres,
        cuotas: cuotas,
        fechaProximoPago: fechaProximoPago,
      );
}
