import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final c = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          "Bienvido",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.3,
              decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
              child: Center(
                child: 1 > 10
                    ? Container(
                        width: size.width * 0.8,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      )
                    : const Column(
                        children: [
                          Icon(
                            Icons.business,
                            color: Colors.white,
                            size: 150,
                          ),
                          Text(
                            "Nombre empresa",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
              ),
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.63,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomScrollView(
                  slivers: [
                    SliverGrid.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: menuitems
                            .map((item) => HomeMenuItem(
                                title: item.title,
                                icon: item.icon,
                                route: item.route))
                            .toList()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton:
          // ignore: prefer_const_constructors
          1 == 1
              ? FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.deepPurple,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 35,
                  ),
                )
              : null,
    );
  }
}

class MenuItem {
  final String title;
  final IconData icon;
  final String route;
  MenuItem(this.title, this.icon, this.route);
}

final menuitems = <MenuItem>[
  MenuItem("Prestamos", Icons.monetization_on_rounded, "/prestamos"),
  MenuItem(
      "Prestamos a vencer", Icons.notifications_active, "/prestamosavencer"),
  MenuItem("Prestamos Vencidos", Icons.notification_important,
      "/prestamosavencidos"),
  MenuItem("Prestamos Finalizados", Icons.assignment_outlined,
      "/prestamofinalizado"),
  MenuItem("Usuarios", Icons.group_add_rounded, "/reporte"),
];

class HomeMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;
  final List<Color> bgColor;

  const HomeMenuItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.route,
      this.bgColor = const [Colors.lightBlue, Colors.deepPurple]});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.deepPurple),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 70,
            ),
            const SizedBox(height: 10),
            SizedBox(
                // width: 300,
                // height: 70,
                child: Text(title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 20, color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
