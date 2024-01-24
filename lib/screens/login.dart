import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prestamo/providers/local_auth_providers.dart';
import 'package:prestamo/providers/login_providers.dart';
import 'package:prestamo/widgets/customInput.dart';
import 'package:prestamo/widgets/login_fondo.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginFondoScreen(
        inputs: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 250,
            ),
            CardInput(
              cardinput: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Acceso al Sistema',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 10),
                  _Formulario(),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        )),
      ),
    );
  }
}

class CardInput extends StatelessWidget {
  final Widget cardinput;
  const CardInput({super.key, required this.cardinput});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.deepPurple, blurRadius: 15, offset: Offset(0, 15))
          ],
        ),
        child: cardinput,
      ),
    );
  }
}

class _Formulario extends ConsumerWidget {
  const _Formulario({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final loginForm = ref.watch(loginProviderpeticiones.notifier);
    print(loginForm.isLoading);
    final token = ref.watch(tokenProvider);
    final canVerificarBiometrico = ref.watch(caCheckBiometricoProvider);
    final localauthprovider = ref.watch(localAutorizacionProvider);
    GlobalKey<FormState> formKey = new GlobalKey<FormState>();
    final usuario = TextEditingController();
    final password = TextEditingController();
    return Container(
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            InputText(
                label: 'Usuario',
                controller: usuario,
                suffixIcon: const Icon(
                  Icons.location_history_rounded,
                  color: Colors.deepPurple,
                )),
            const SizedBox(height: 15),
            InputText(
                label: 'Password',
                controller: password,
                suffixIcon: const Icon(
                  Icons.lock_outline,
                  color: Colors.deepPurple,
                )),
            const SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 1,
              color: Colors.deepPurple,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    loginForm.isLoading ? 'Espere' : 'Ingresar',
                    style: const TextStyle(color: Colors.white),
                  )),
              onPressed: () {
                context.replace('/inicio');
              },
            ),
            SizedBox(height: 20),
            if (token.value == null)
              canVerificarBiometrico.when(
                  data: (canCheck) => IconButton(
                        icon: const Icon(
                          Icons.fingerprint_rounded,
                          size: 50,
                          color: Colors.deepPurple,
                        ),
                        onPressed: () async {
                          final (verificar, msg) = await ref
                              .read(localAutorizacionProvider.notifier)
                              .autenticaciondeusuario();
                          if (verificar) {
                            context.replace('/inicio');
                          } else {
                            print(1111111);
                          }
                        },
                      ),
                  error: (error, _) => Text('Error:$error'),
                  loading: () => const CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
