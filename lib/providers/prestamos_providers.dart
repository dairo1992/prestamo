import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prestamo/models/prestamos_model.dart';
import 'package:prestamo/services/prestamos_services.dart';

final peticones = PrestamosServices();

final prestamosProvider =
    FutureProvider.autoDispose<List<PrestamosModel>>((ref) async {
  final listaprestamos = await peticones.getPrestamos();
  return listaprestamos;
});
