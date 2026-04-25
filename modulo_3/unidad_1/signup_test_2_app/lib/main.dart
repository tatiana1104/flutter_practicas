import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistroPage(),
    );
  }
}

class RegistroPage extends StatefulWidget {
  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {

  final nombreCtrl = TextEditingController();
  final correoCtrl = TextEditingController();
  final edadCtrl = TextEditingController();

  String mensaje = "";

  void guardar() {

    if (nombreCtrl.text.isEmpty ||
        correoCtrl.text.isEmpty ||
        edadCtrl.text.isEmpty) {

      setState(() {
        mensaje = "Todos los campos son obligatorios";
      });

      return;
    }

    setState(() {
      mensaje = "Usuario registrado correctamente";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro Usuario"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              key: Key("txtNombre"),
              controller: nombreCtrl,
              decoration: InputDecoration(
                labelText: "Nombre",
              ),
            ),

            SizedBox(height: 15),

            TextField(
              key: Key("txtCorreo"),
              controller: correoCtrl,
              decoration: InputDecoration(
                labelText: "Correo",
              ),
            ),

            SizedBox(height: 15),

            TextField(
              key: Key("txtEdad"),
              controller: edadCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Edad",
              ),
            ),

            SizedBox(height: 25),

            ElevatedButton(
              key: Key("btnGuardar"),
              onPressed: guardar,
              child: Text("Guardar"),
            ),

            SizedBox(height: 20),

            Text(
              mensaje,
              key: Key("lblMensaje"),
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}