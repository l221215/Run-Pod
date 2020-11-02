import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Tela6_MudancaValores.dart';
import 'FuncoesBluetooth.dart';

class Tela5 extends StatefulWidget {
  final device;
  final altura;
  const Tela5({Key key, this.device, this.altura}) : super(key: key);
  @override
  _Tela5State createState() => _Tela5State(device, altura);
}

class _Tela5State extends State<Tela5> {
  final device;
  final altura;
  _Tela5State (this.device, this.altura);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Define cor de fundo
        backgroundColor: Colors.lightGreenAccent[100],
        appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent,
          title: Text("Valores em tempo real:", textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0)),
        ),
        body: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Velocidade atual: ',
                          style: TextStyle(fontSize: 20),),
                        Text(receberEsp(device), style: TextStyle(
                          fontSize: 35, color: const Color(0xFF1DDE7D), //cor
                        ),
                        ),
                      ]
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.05),
                  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Velocidade média: ',
                          style: TextStyle(fontSize: 20),),
                        Text('0,754' + ' Km/h', style: TextStyle(
                          fontSize: 35, color: const Color(0xFF1DDE7D), //cor
                        ),
                        ),
                      ]
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.05),
                  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Cadência: ', style: TextStyle(fontSize: 20),),
                        Text('15' + ' p/min', style: TextStyle(
                          fontSize: 35, color: const Color(0xFF1DDE7D), //cor
                        ),
                        ),
                      ]
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.05),
                  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Distãncia: ', style: TextStyle(fontSize: 20),),
                        Text('80' + ' m', style: TextStyle(
                          fontSize: 35, color: const Color(0xFF1DDE7D), //cor
                        ),
                        ),
                      ]
                  ),
                  SizedBox(height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.05),
                  FlatButton(
                    color: Colors.lightGreenAccent,
                    textColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    onPressed: () {
                      /*...*/
                    },
                    child: Text(
                      "Reset",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  )
                ]
            )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Tela6()));
          },
          child: Icon(Icons.arrow_forward, color: Colors.black),
          //icone da flecha
          backgroundColor: Colors.lightGreenAccent,
        )
    );
  }
}