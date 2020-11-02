import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Tela2_ChamaBluetooth.dart';


class Tela1S extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Tela1(),
      debugShowCheckedModeBanner: false, //tira a faixa de debug
    );
  }
}

class Tela1 extends StatefulWidget {
  @override
  _Tela1State createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        // Define cor de fundo
        backgroundColor: Colors.lightGreenAccent[100],
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/start.png',height: 400.0, width: 200.0),
              Text("Run Pod",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 50.0))
            ],
          ),
        ),
        //BOTÃO PARA PASSAR PARA A PRÓXIMA TELA
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Tela2()));
            },
              child: Icon(Icons.arrow_forward, color: Colors.black), //icone da flecha
              backgroundColor: Colors.lightGreenAccent,
            ),
    );
  }
}
