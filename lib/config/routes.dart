import 'package:go_router/go_router.dart';
import 'package:prestamo/screens/screens.dart';

final router = GoRouter(initialLocation: "/", routes: [
  GoRoute(path: "/", builder: (context, state) => const InicioScreen()),
  GoRoute(path: "/login", builder: (context, state) => LoginScreen()),
  GoRoute(path: "/inicio", builder: (context, state) => const InicioScreen()),
  GoRoute(
      path: "/prestamos", builder: (context, state) => const PrestamosScreen()),
  GoRoute(
      path: "/prestamosavencer",
      builder: (context, state) => const PrestamosaVencerScreen()),
  GoRoute(
      path: "/prestamosavencidos",
      builder: (context, state) => const PrestamosVencidosScreen()),
  GoRoute(
      path: "/prestamofinalizado",
      builder: (context, state) => const PrestamosFinalizadoScreen()),
  GoRoute(
      path: "/detalle-prestamos",
      builder: (context, state) {
        Map<String, dynamic> args = state.extra as Map<String, dynamic>;
        return DetallePrestamoScreen(
          nombre: args["nombre"],
          idPrestamo: args["idPrestamo"],
          cuotapagar: args["cuotapagar"],
          direccion: args["direccion"],
          telefono: args["telefono"],
          monto: args["monto"],
          tasaInteres: args["tasaInteres"],
          cuotas: args["cuotas"],
          tipointeres: args["tipointeres"],
          fechaprestamo: args["fechaprestamo"],
          fechaultimacuota: args["fechaultimacuota"],
          finalizado: args["finalizado"],
        );
      }),
        GoRoute(
      path: "/simulador",
      builder: (context, state) => const Simulador()),
]);
