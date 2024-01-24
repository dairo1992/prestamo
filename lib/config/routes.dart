import 'package:go_router/go_router.dart';
import 'package:prestamo/screens/screens.dart';

final router = GoRouter(initialLocation: "/", routes: [
  GoRoute(path: "/", builder: (context, state) => LoadingPage()),
  GoRoute(path: "/login", builder: (context, state) => LoginScreen()),
  GoRoute(path: "/inicio", builder: (context, state) => InicioScreen()),
  GoRoute(path: "/prestamos", builder: (context, state) => PrestamosScreen()),
  GoRoute(
      path: "/prestamosavencer",
      builder: (context, state) => PrestamosaVencerScreen()),
  GoRoute(
      path: "/prestamosavencidos",
      builder: (context, state) => PrestamosVencidosScreen()),
  GoRoute(
      path: "/prestamofinalizado",
      builder: (context, state) => PrestamosFinalizadoScreen()),
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
]);
