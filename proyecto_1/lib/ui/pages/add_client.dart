import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Clientes.dart';
import 'package:proyecto_1/ui/controllers/Client_controller.dart';

class NewclientePage extends StatefulWidget {
  const NewclientePage({Key? key}) : super(key: key);

  @override
  _NewClientePageState createState() => _NewClientePageState();
}

class _NewClientePageState extends State<NewclientePage> {
  final controllerId = TextEditingController();
  final controllerNombre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ClientController clienteController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nuevo Cliente',
          style: TextStyle(
            color: Colors.white, // Título en blanco
          ),
        ),
        leading:
            const Icon(Icons.person_add, color: Colors.white), // Icono blanco
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0), // Bordes circulares
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Sombra suave
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // Posición de la sombra
                ),
              ],
            ),
            child: ListView(
              shrinkWrap: true, // Para ajustar el tamaño del contenido
              children: [
                const SizedBox(height: 16),
                TextField(
                  key: const Key('nombrecliente'),
                  controller: controllerNombre,
                  decoration: const InputDecoration(
                    labelText: 'Nombre del Cliente',
                    prefixIcon: Icon(Icons.person), // Icono para nombre
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: SizedBox(
                    width: 200, // Ancho reducido para el botón
                    child: ElevatedButton(
                      key: const Key('Buttonconfirmaragregarcliente'),
                      onPressed: () async {
                        await clienteController.addcliente(
                          Cliente(
                            name: controllerNombre.text,
                          ),
                        );
                        Get.back(); // Regresar a la página anterior
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.save), // Icono para guardar
                          SizedBox(width: 8),
                          Text("Guardar Cliente"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
