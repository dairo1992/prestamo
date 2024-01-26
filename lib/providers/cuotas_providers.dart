import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prestamo/models/cuotas_model.dart';
import 'package:prestamo/models/pagar_cuota_model.dart';
import 'package:prestamo/services/cuotas_services.dart';

final peticones = CuotasServices();

final cuotasProvider = FutureProvider.autoDispose
    .family<List<CuotasModel>, int>((ref, idprestamo) async {
  final listacuotas = await peticones.postCuotas(idprestamo);
  return listacuotas;
});

class NuevaAlarmaProvider extends StateNotifier<List<PagarCuotaResponse>> {
  NuevaAlarmaProvider() : super([]);
  final peticion = CuotasServices();
  bool isLoading = false;

  Future<PagarCuotaResponse?> sedcuota(int idPrestamo, int idcuota,
      String cuotacancelar, int tasaInteres, String? tipointeres) async {
    final alarmamasiva = await peticion.postPagarCuota(
        idPrestamo, idcuota, cuotacancelar, tasaInteres, tipointeres);
    if (alarmamasiva!.codigo == "0") {
      state = [...state, alarmamasiva];
      isLoading = false;
      return (alarmamasiva);
    }
    isLoading = false;
    return (alarmamasiva);
  }
}

final pagarcuotasProvider =
    StateNotifierProvider<NuevaAlarmaProvider, List<PagarCuotaResponse>>((ref) {
  return NuevaAlarmaProvider();
});
