import 'package:go_router/go_router.dart';
import 'package:prestamo/screens/screens.dart';

final router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => InicioScreen()),
]);
