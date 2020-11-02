import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue/flutter_blue.dart';

//Tela que mostra ao usuário que o bluetooth do seu dispositivo está desativado

class BluetoothOffScreen extends StatelessWidget {

  const BluetoothOffScreen({Key key, this.state}) : super(key: key);
  final BluetoothState state;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,]);
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[100], //cor de fundo
      body: Center( //posição da coluna
        child: Column(// posiciona o Icon, Container e Text em forma de coluna
          mainAxisSize: MainAxisSize.min, // Minimiza a quantidade de espaço livre ao longo do eixo principal
          children: <Widget>[
            Icon(
              Icons.bluetooth_disabled, //tipo de ícone
              size: 150.0,
              color: Colors.white,
            ),
            Container(height: 30,), //Fins de estética, deixar o ícone e o texto mais separados
            Text('Bluetooth está desligado',
                style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)
            ),
          ],
        ),
      ),
    );
  }
}