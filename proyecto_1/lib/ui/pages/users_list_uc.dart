import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_1/domain/models/Usuarios.dart';
import 'package:proyecto_1/ui/controllers/User_controller.dart';
import 'package:proyecto_1/ui/pages/add_user.dart';
import 'package:proyecto_1/ui/pages/view_user_uc.dart';

class UsersListUc extends StatefulWidget {
  const UsersListUc({super.key});

  @override
  State<UsersListUc> createState() => _UsersListUc();
}

class _UsersListUc extends State<UsersListUc> {
  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              const Text("Trabajadores", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blueAccent,
          iconTheme: const IconThemeData(color: Colors.white)),
      body: Center(child: _getXlistView()),
      floatingActionButton: FloatingActionButton(
        key: const Key('Buttonagregarusuario'),
        onPressed: () async {
          Get.to(
            () => const NewUserPage(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _getXlistView() {
    return Obx(
      () => ListView.builder(
        itemCount: userController.users.length,
        itemBuilder: (context, index) {
          Usuario usuario = userController.users[index];
          return Card(
            child: ListTile(
              title: Text(usuario.gname),
              subtitle: Text(usuario.gcorreo),
              onTap: () {
                Get.to(UsuarioView(usuario: usuario));
              },
            ),
          );
        },
      ),
    );
  }
}
