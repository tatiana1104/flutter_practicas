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
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController ageCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up App"),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column (
          children: [
            TextField(
              key: Key("txtName"),
              controller: nameCtrl,
              decoration: InputDecoration(
                labelText: "Nombre",
              ),
            ),

            SizedBox(height: 20),

            TextField(
              key: Key("txtEmail"),
              controller: emailCtrl,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),

            SizedBox(height: 20),

            TextField(
              key: Key("txtAge"),
              controller: ageCtrl,
              decoration: InputDecoration(
                labelText: "Edad",
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton(
              key: Key("btnSignUp"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomePage(
                      usuario: nameCtrl.text,
                    ),
                  ),
                );
              },
              child: Text("Guardar"),
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

