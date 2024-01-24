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
