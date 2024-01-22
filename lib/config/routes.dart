import 'package:go_router/go_router.dart';
import 'package:prestamo/screens/screens.dart';

final router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => LoadingPage()),
  GoRoute(path: "/login", builder: (context, state) => LoginScreen()),
  GoRoute(path: "/inicio", builder: (context, state) => InicioScreen()),
]);
