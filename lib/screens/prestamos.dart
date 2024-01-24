import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:prestamo/providers/prestamos_providers.dart';
import 'package:prestamo/widgets/customInput.dart';

class PrestamosScreen extends ConsumerStatefulWidget {
  const PrestamosScreen({super.key});

  @override
  ConsumerState createState() => _PrestamosScreenState();
}

class _PrestamosScreenState extends ConsumerState<PrestamosScreen> {
  final nombrebuscar = TextEditingController();
  NumberFormat currencyFormat = NumberFormat.decimalPattern('es_CO');
  Widget build(BuildContext context) {
    final listadoprestamos = ref.watch(prestamosProvider);
    final size = MediaQuery.of(context).size;
    //  NumberFormat currencyFormat = NumberFormat.simpleCurrency(
    //   locale: 'es_CO',
    //   name: '\$', // Símbolo de moneda al principio
    //   decimalDigits: 0, // Sin decimales
    // );
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text(
          "Prestamos Activos",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.add_circle_outline_outlined,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: InputText(
                  onChanged: (text) {
                    setState(() {});
                  },
                  label: 'Buscar Por Nombre',
                  controller: nombrebuscar,
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.deepPurple,
                  )),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: size.height * 0.75,
              width: size.width * 0.95,
              child: listadoprestamos.when(
                data: (data) {
                  final searchTerm = nombrebuscar.text.toLowerCase();
                  List<dynamic> datosdellistado = data
                      .where((pre) => pre.nombre
                          .toLowerCase()
                          .contains(searchTerm.toLowerCase()))
                      .toList();

                  return datosdellistado.isNotEmpty
                      ? ListView.builder(
                          itemCount: datosdellistado.length,
                          itemBuilder: (BuildContext context, int index) {
                            final cuotapagar = datosdellistado[index].monto /
                                datosdellistado[index].cuotas;
                            return GestureDetector(
                              onTap: () {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);
                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                context.push("/detalle-prestamos", extra: {
                                  'nombre': datosdellistado[index].nombre,
                                  'idPrestamo': datosdellistado[index].id,
                                  'cuotapagar': cuotapagar,
                                  'direccion': datosdellistado[index].direccion,
                                  'telefono': datosdellistado[index].telefono,
                                  'monto': datosdellistado[index].monto,
                                  'tasaInteres':
                                      datosdellistado[index].tasaInteres,
                                  'cuotas': datosdellistado[index].cuotas,
                                  'tipointeres':
                                      datosdellistado[index].tipointeres,
                                  'fechaprestamo':
                                      datosdellistado[index].fechaprestamo,
                                  'fechaultimacuota':
                                      datosdellistado[index].fechaultimacuota,
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 85,
                                  width: size.width * 0.95,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.deepPurple,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.monetization_on,
                                          size: 58,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 20),
                                        Column(
                                          children: [
                                            Text(
                                              datosdellistado[index].nombre,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                                '${datosdellistado[index].fechaProximoPago} - \$${currencyFormat.format(cuotapagar.toInt())}',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })
                      : Center(
                          child: Text('No se Hayaron Resultados'),
                        );
                },
                error: (error, stackTrace) => Center(child: Text("$error")),
                loading: () => Center(
                  child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.deepPurple),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
