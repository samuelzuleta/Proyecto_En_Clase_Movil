import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Reportes.dart';
import 'package:proyecto_1/ui/pages/controllers/Report_controller.dart';
import 'package:proyecto_1/ui/pages/controllers/login_controller.dart';
import 'package:proyecto_1/ui/pages/pages/add_report.dart';
import 'package:proyecto_1/ui/pages/pages/login.dart';
import 'package:proyecto_1/ui/pages/pages/view_report.dart';

class Reportlist extends StatefulWidget {
  const Reportlist({super.key});

  @override
  State<Reportlist> createState() => _Reportlist();
}

class _Reportlist extends State<Reportlist> {
  ReportController reportController = Get.find();
  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text("Bienvenido, ${loginController.nombreusuario}"),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              loginController.logout();
              Get.offAll(const LoginScreen(key: Key('LoginScreen')));
            },
          ),
        ],
      ),
      body: Center(child: _getXlistView()), // Asumiendo que esta función existe
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const NewReportPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _getXlistView() {
    return Obx(
      () => ListView.builder(
        itemCount: reportController.reports.length,
        itemBuilder: (context, index) {
          Reporte reporte = reportController.reports[index];
          return Card(
            child: ListTile(
              title: Text(reporte.gtitle),
              subtitle: Text(reporte.body),
              onTap: () {
                Get.to(ReporteView(reporte: reporte));
              },
            ),
          );
        },
      ),
    );
  }
}
