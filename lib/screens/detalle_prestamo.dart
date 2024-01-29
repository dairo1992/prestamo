import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:prestamo/providers/cuotas_providers.dart';
import 'package:prestamo/widgets/customInput.dart';

class DetallePrestamoScreen extends ConsumerWidget {
  final String nombre;
  final int idPrestamo;
  final int idcuota;
  final int cuotapagar;
  final String? direccion;
  final String? telefono;
  final int monto;
  final int tasaInteres;
  final int cuotas;
  final String? tipointeres;
  final String? fechaprestamo;
  final String? fechaultimacuota;
  final int totalpagado;
  final int finalizado;
  const DetallePrestamoScreen({
    super.key,
    required this.nombre,
    required this.idPrestamo,
    required this.idcuota,
    required this.cuotapagar,
    this.direccion,
    this.telefono,
    required this.monto,
    required this.tasaInteres,
    required this.cuotas,
    this.tipointeres,
    this.fechaprestamo,
    this.fechaultimacuota,
    required this.totalpagado,
    required this.finalizado,
  });
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
        title: Text(
          nombre,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * 0.35,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Monto a Cancelar',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  '\$${currencyFormat.format(cuotapagar)}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Monto Pagado',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  '\$${currencyFormat.format(totalpagado)}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ]),
                        ],
                      ),
                      Divider(
                        color: Colors.lightBlueAccent,
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Direccion',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  direccion!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlueAccent),
                                ),
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Telefono',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  telefono!,
                                  style: const TextStyle(
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
                                const Text(
                                  'Monto',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  '\$${currencyFormat.format(monto)}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlueAccent),
                                ),
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Interes',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  '$tasaInteres %',
                                  style: const TextStyle(
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
                                const Text(
                                  'Tipo Interes',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  tipointeres!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlueAccent),
                                ),
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  '# de Cuotas',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  cuotas.toString(),
                                  style: const TextStyle(
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
                                const Text(
                                  'Fecha Prestamo',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  fechaprestamo!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlueAccent),
                                ),
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Fecha Ult. Cuota',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  fechaultimacuota!,
                                  style: const TextStyle(
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
            const SizedBox(height: 10),
            if (finalizado == 0)
              Padding(
                padding: const EdgeInsets.all(4.0),
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
                        verdialogo(context, ref);
                      },
                      icon: const Icon(
                        Icons.monetization_on,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Pagar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 7),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Refinanciar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 7),
                    TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.check_box,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Finalizar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            if (finalizado == 1)
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.check_box,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'La Deuda a Sido Pagada',
                    style: TextStyle(color: Colors.white),
                  ),
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
                              color: data[index].estado == 'A'
                                  ? Colors.red
                                  : Colors.deepPurple,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.monetization_on,
                                    size: 58,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    children: [
                                      Text(
                                        data[index].estado == 'A'
                                            ? 'Pendiente Pagar'
                                            : 'Pagada',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                          '${data[index].fechapago} - \$${currencyFormat.format(data[index].cuotaactual)}',
                                          style: const TextStyle(
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
                  loading: () => const Center(
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

  void verdialogo(BuildContext context, WidgetRef ref) async {
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
                            onPressed: () async {
                              EasyLoading.show(
                                  status: 'Registrando Pago...',
                                  maskType: EasyLoadingMaskType.clear);
                              final nuevaservice = await ref
                                  .read(pagarcuotasProvider.notifier)
                                  .sedcuota(
                                      idPrestamo,
                                      idcuota, //traerme el id de la cuota al momento de cancelar uno
                                      cuotacancelar.text,
                                      tasaInteres,
                                      tipointeres);
                              if (nuevaservice!.codigo == '0') {
                                EasyLoading.showSuccess('Pago Registrado');
                              } else {
                                EasyLoading.showError(
                                    'Error al registrar el pago');
                              }
                              Navigator.pop(context);
                              EasyLoading.dismiss();
                              ref.refresh(cuotasProvider(idPrestamo));
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
