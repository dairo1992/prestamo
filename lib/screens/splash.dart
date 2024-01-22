import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.deepPurple, Colors.white],
        )),
        child: FutureBuilder(
          future: scren(context),
          builder: (context, snapshot) {
            return ZoomIn(
              delay: const Duration(milliseconds: 500),
              duration: const Duration(milliseconds: 1000),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: Column(
                      children: [
                        FadeInDown(
                          animate: true,
                          delay: const Duration(milliseconds: 1200),
                          duration: const Duration(milliseconds: 1000),
                          child: Icon(Icons.monetization_on_outlined),
                        ),
                        FadeInUp(
                            animate: true,
                            delay: const Duration(milliseconds: 1200),
                            duration: const Duration(milliseconds: 1000),
                            child: Icon(Icons.arrow_right_alt_rounded)),
                      ],
                    ),
                  ),
                  ZoomIn(
                    delay: const Duration(milliseconds: 1200),
                    duration: const Duration(milliseconds: 1000),
                    child: const Text(
                      'Prestamos',
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  )
                ],
              )),
            );
          },
        ),
      ),
    );
  }
}

Future scren(BuildContext context) async {
  await Future.delayed(
      const Duration(milliseconds: 5000), () => context.replace("/login"));
}
