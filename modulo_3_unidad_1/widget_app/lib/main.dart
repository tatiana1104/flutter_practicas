import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: CounterPage()
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  int count = 0;

  void incrementar(){
    setState(() {
      count++;
    });
  } 

  void decrementar(){
    setState(() {
      count--;
    });
  }

  void reiniciar(){
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador"),
      ),

      body: Center(
        child: Text("$count",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold
          ),
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //boton izquierdo
          FloatingActionButton(
            onPressed: decrementar,
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10,),

          //boton del medio
          FloatingActionButton(
            onPressed: reiniciar,
            child: Icon(Icons.refresh),
          ),


          FloatingActionButton(
            onPressed: incrementar,
            child: Icon(Icons.add),
          )
        ],
      ),

      
        
    );
  }
}
