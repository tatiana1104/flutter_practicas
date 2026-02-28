import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


/* ejercicio 1 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //quitamos la cinta debug
      debugShowCheckedModeBanner: false,

      //aqui llamamos al nuevo widget que contendra el scaffold
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi primera aplicacion"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: 
        Text("Dev senior code", style: TextStyle(fontSize: 24)),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("boton presionado");
        },
        child: const Icon(Icons.add),  
      ),
    );
  }
}


//========================================================


/*
class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
Widget build(BuildContext context) {
    return Scaffold(

      

      /*body: Center(

        //contenedor
        child: Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10.0),
          ),

          //texto de bienvenidaa
          child: Text("Bienvenido a Flutter", 
          style: TextStyle(color: Colors.white, fontSize: 18)),

        ),
        ),*/


        //columnas
      /*body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text("Elemento 1", style: TextStyle(fontSize: 20)),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text("Elemento 2", style: TextStyle(fontSize: 20)),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.start, color: Colors.amber, size: 30),
              Icon(Icons.start, color: Colors.amber, size: 30),
              Icon(Icons.start, color: Colors.amber, size: 30),
            ],
          ),
        ],
      ),*/

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            const Text(
              "Titulo Principal",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple
              ),
            ),

            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: "Nombre Usuario",
                hintText: "Escribe tu nombre",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        ),

      //agregamos un boton flotante
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("boton Presionad");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

/*
class MyApp extends StatelessWidget {
  //para que ocupe tod L pNTll
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //quitar cinta debug
      debugShowCheckedModeBanner: false,

      title: 'Floter APP',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      //aqui llamamos a nuevo widget que contendra el Scaffold
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Logo de la Aplicacion'),
      ),

      body: Center(
        child: MyLogo(),
      ),
    );

  }
}

class MyLogo extends StatelessWidget{
  const MyLogo({super.key});
  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.pets, size: 150, color: Colors.red);
  }
}
*/

/*class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Fluter APP',
      theme: ThemeData(
        primarySwatch: Colors.blue, 
        useMaterial3: true,
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Text("Ejemplo de StatefulWidget")
        ),

        body: Center(child: CounterWidget()),
        )
    )
  }
}

class CounterWidget extends StatefulWidget {

  @override
  _CounterWidgetState createState()=> _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget>{
  int _counter =0;

  void _increment(){
    setState(() {
      _counter++;
    });
  }
}

@override
Widget build(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Contador: $_counter",
        style: Theme.of(context).textTheme.headlineMedium,
      )
      SizedBox(height: 16),
      ElevatedButton(
        onPressed: _increment, 
        child: Text("Incrementar")
        )
    ],
  )
}*/
