import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:prestamo/config/funciones_genericas.dart';
import 'package:prestamo/providers/prestamos_providers.dart';
import 'package:prestamo/widgets/customInput.dart';
import 'package:prestamo/widgets/customSelect.dart';

class Simulador extends ConsumerWidget {
  const Simulador({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final TextEditingController valor = TextEditingController();
    final TextEditingController interes = TextEditingController();
    final TextEditingController cuotas = TextEditingController();
    final TextEditingController tipoPago = TextEditingController();
    final TextEditingController tipoInteres = TextEditingController();
    final TextEditingController fecha = TextEditingController();
    final TextEditingController documento = TextEditingController();
    final TextEditingController nombre = TextEditingController();
    final TextEditingController direccion = TextEditingController();
    final TextEditingController telefono = TextEditingController();
    final NumberFormat usCurrency = NumberFormat('\$#,##0', 'es_CO');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo Prestamo"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputText(
              label: "Valor",
              controller: valor,
              keyboardType: TextInputType.number,
              onChanged: (p0) {
                valor.text = usCurrency
                    .format(int.parse(FuncionesGenericas().numberFormat(p0)));
              },
            ),
            InputText(
                label: "Interes",
                controller: interes,
                keyboardType: TextInputType.number,
                onChanged: (p0) =>
                    interes.text = FuncionesGenericas().numberFormat(p0),
                suffixIcon: const Icon(Icons.percent)),
            InputText(
              label: "Cuotas",
              controller: cuotas,
              onChanged: (p0) =>
                  cuotas.text = FuncionesGenericas().numberFormat(p0),
              keyboardType: TextInputType.number,
            ),
            CustomSelect(items: const [
              {"CODIGO": 'D', "NOMBRE": 'Diario'},
              {"CODIGO": 'S', "NOMBRE": 'Semanal'},
              {"CODIGO": 'Q', "NOMBRE": 'Quincenal'},
              {"CODIGO": 'M', "NOMBRE": 'Mensual'}
            ], controller: tipoPago),
            CustomSelect(items: const [
              {"CODIGO": 'C', "NOMBRE": 'CORRIENTE'},
              {"CODIGO": 'F', "NOMBRE": 'TASA FIJA'}
            ], controller: tipoInteres),
            InputText(
                label: "Fecha",
                controller: fecha,
                isCalendar: true,
                readOnly: true),
            ElevatedButton(
              child: const Text('SIMULAR'),
              onPressed: () async {
                if (valor.text != '' &&
                    int.parse(FuncionesGenericas().numberFormat(valor.text)) >
                        0 &&
                    int.parse(FuncionesGenericas().numberFormat(interes.text)) >
                        0 &&
                    int.parse(FuncionesGenericas().numberFormat(cuotas.text)) >
                        0 &&
                    interes.text != '' &&
                    cuotas.text != '' &&
                    tipoPago.text != '' &&
                    tipoInteres.text != '' &&
                    fecha.text != '') {
                  var json = {
                    'valor': int.parse(
                        FuncionesGenericas().numberFormat(valor.text)),
                    'interes': int.parse(
                        FuncionesGenericas().numberFormat(interes.text)),
                    'cuotas': int.parse(
                        FuncionesGenericas().numberFormat(cuotas.text)),
                    'tipoPago': tipoPago.text,
                    'tipoInteres': tipoInteres.text,
                    'fecha': fecha.text
                  };
                  ref.read(simuladorProvider(json));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Text(
                      'Todos los campos son requeridos!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
