import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:prestamo/providers/cuotas_providers.dart';
import 'package:prestamo/widgets/customInput.dart';

class DetallePrestamoScreen extends ConsumerWidget {
  final int idPrestamo;
  const DetallePrestamoScreen({super.key, required this.idPrestamo});
  @override
  Widget build(BuildContext context, ref) {
    NumberFormat currencyFormat = NumberFormat.decimalPattern('es_CO');
    final size = MediaQuery.of(context).size;
    final listadocuotas = ref.watch(cuotasProvider(idPrestamo));
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text(
          "Detalle Prestamo",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.list_alt,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * 0.30,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple,
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Monto a Cancelar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Text(
                              '\$250.000',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Direccion',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  'Calle 45 # 12-12',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlueAccent),
                                ),
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Telefono',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  '3135936565',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlueAccent),
                                ),
                              ]),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Monto',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  '\$ 1.200.000',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlueAccent),
                                ),
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Interes',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  '20 %',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlueAccent),
                                ),
                              ]),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tipo Interes',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  'Corriente',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlueAccent),
                                ),
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '# de Cuotas',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  '5',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlueAccent),
                                ),
                              ]),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Fecha Prestamo',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  '01/01/2024',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlueAccent),
                                ),
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Fecha Ult. Cuota',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  '01/06/2024',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlueAccent),
                                ),
                              ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onPressed: () {
                      verdialogo(context);
                    },
                    icon: Icon(
                      Icons.monetization_on,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Pagar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 7),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Refinanciar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: size.height * 0.40,
              width: size.width * 0.95,
              child: SizedBox(
                height: size.height * 0.75,
                width: size.width * 0.95,
                child: listadocuotas.when(
                  data: (data) => ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                        'Pagado',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                          '${data[index].fechapago} - \$${currencyFormat.format(data[index].cuotaactual)}',
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
                        );
                      }),
                  error: (error, stackTrace) => Center(child: Text("$error")),
                  loading: () => Center(
                    child: CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.deepPurple),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void verdialogo(BuildContext context) async {
    final cuotacancelar = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            constraints: const BoxConstraints(maxHeight: 470, minWidth: 600),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'Cancelar Cuota',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 15),
                      InputText(
                          label: 'Cantidad Cancelar',
                          keyboardType: TextInputType.number,
                          controller: cuotacancelar,
                          suffixIcon: const Icon(
                            Icons.monetization_on_outlined,
                            color: Colors.deepPurple,
                          )),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            disabledColor: Colors.grey,
                            elevation: 1,
                            color: Colors.deepPurple,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Guardar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 15),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            disabledColor: Colors.grey,
                            elevation: 1,
                            color: Colors.red,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
