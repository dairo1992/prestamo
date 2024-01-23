import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetallePrestamoScreen extends ConsumerWidget {
  final int idPrestamo;
  const DetallePrestamoScreen({super.key, required this.idPrestamo});
  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;
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
      body: Column(
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
            ),
          )
        ],
      ),
    );
  }
}
