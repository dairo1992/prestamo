import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prestamo/models/cuotas_model.dart';
import 'package:prestamo/services/cuotas_services.dart';

final peticones = CuotasServices();

final cuotasProvider = FutureProvider.autoDispose
    .family<List<CuotasModel>, int>((ref, idprestamo) async {
  final listacuotas = await peticones.postCuotas(idprestamo);
  return listacuotas;
});
