import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage()
    );
  }
}

class LoginPage extends StatelessWidget{
  final TextEditingController userCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login App"),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column (
          children: [
            TextField(
              key: Key("txtUser"),
              controller: userCtrl,
              decoration: InputDecoration(
                labelText: "Usuario",
              ),
            ),

            SizedBox(height: 20),

            TextField(
              key: Key("txtPass"),
              controller: passCtrl,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Clave",
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton(
              key: Key("btnLogin"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomePage(
                      usuario: userCtrl.text,
                    ),
                  ),
                );
              },
              child: Text("Ingresar"),
            ),
          ],
        )
      )
    );
  }
}

class HomePage extends StatelessWidget {
  final String usuario;

  HomePage({required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
      ),

      body: Center(
        child: Text("Bienvenido, $usuario!"),
      ),
    );
  }
}

