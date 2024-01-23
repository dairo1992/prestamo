import 'package:go_router/go_router.dart';
import 'package:prestamo/screens/screens.dart';

final router = GoRouter(initialLocation: "/inicio", routes: [
  GoRoute(path: "/", builder: (context, state) => LoadingPage()),
  GoRoute(path: "/login", builder: (context, state) => LoginScreen()),
  GoRoute(path: "/inicio", builder: (context, state) => InicioScreen()),
  GoRoute(path: "/prestamos", builder: (context, state) => PrestamosScreen()),
  GoRoute(
      path: "/detalle-prestamos",
      builder: (context, state) {
        Map<String, dynamic> args = state.extra as Map<String, dynamic>;
        return DetallePrestamoScreen(
          idPrestamo: args["idPrestamo"],
        );
      }),
]);
