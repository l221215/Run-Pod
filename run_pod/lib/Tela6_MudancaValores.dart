import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Tela5_MostraValores.dart';

class Tela6S extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tela6(),
      debugShowCheckedModeBanner: false, //tira a faixa de debug
    );
  }
}

class Tela6 extends StatefulWidget {
  @override
  _Tela6State createState() => _Tela6State();
}

class _Tela6State extends State<Tela6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Define cor de fundo
        backgroundColor: Colors.lightGreenAccent[100],
        appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent,
          title: Text("Variação da velocidade:",textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0)),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.05),
              Text('0'+" Km/h "+ "manteve por: " + "5" + "s" + "\n" + '5' + " Km/h " + "manteve por: " + "10" + "s" + "\n" + '4' + " Km/h " + "manteve por: " + "2" + "s" + "\n"+ '6' + " Km/h " + "manteve por: " + "2" + "s" + "\n"+ '7' + " Km/h " + "manteve por: " + "10" + "s" + "\n"+ '6' + " Km/h " + "manteve por: " + "3" + "s" + "\n"+ '8' + " Km/h " + "manteve por: " + "1" + "s" + "\n"+ '9' + " Km/h " + "manteve por: " + "2" + "s" + "\n"+ '5' + " Km/h " + "manteve por: " + "0" + "s" + "\n"+ '3' + " Km/h " + "manteve por: " + "0" + "s" + "\n", style: TextStyle(fontSize: 25),),
            ]
          )
        )
    );
  }
}