import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prestamo/providers/prestamos_providers.dart';
import 'package:prestamo/widgets/customInput.dart';

class PrestamosScreen extends ConsumerWidget {
  const PrestamosScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final listadoprestamos = ref.watch(prestamosProvider);
    final size = MediaQuery.of(context).size;
    final nombrebuscar = TextEditingController();
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
      body: Column(
        children: [
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InputText(
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
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final cuotapagar = data[index].monto / data[index].cuotas;
                      return GestureDetector(
                        onTap: () {},
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
                                        data[index].nombre,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                          '${data[index].fechaProximoPago} - \$${cuotapagar.toInt()}',
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
                    });
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
    );
  }
}
