import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prestamo/models/prestamos_model.dart';
import 'package:prestamo/services/prestamos_services.dart';

final peticones = PrestamosServices();

final prestamosProvider =
    FutureProvider.autoDispose<List<PrestamosModel>>((ref) async {
  final listaprestamos = await peticones.getPrestamos();
  return listaprestamos;
});
final prestamosaVencerProvider =
    FutureProvider.autoDispose<List<PrestamosModel>>((ref) async {
  final listaprestamos = await peticones.getPrestamosaVencer();
  return listaprestamos;
});
final prestamosaVencidosProvider =
    FutureProvider.autoDispose<List<PrestamosModel>>((ref) async {
  final listaprestamos = await peticones.getPrestamosaVencidos();
  return listaprestamos;
});
final prestamosFinalizadoProvider =
    FutureProvider.autoDispose<List<PrestamosModel>>((ref) async {
  final listaprestamos = await peticones.getPrestamosaFinalizado();
  return listaprestamos;
});
final simuladorProvider =
    FutureProvider.family<String, Map<String, dynamic>>((ref, json) async {
    final resp = await peticones.simularCredito(json['valor'], json['interes'],
      json['cuotas'], json['tipoPago'], json['tipoInteres'], json['fecha']);
  return resp;
});
