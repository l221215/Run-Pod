import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'Tela3_FindDevicesScreen.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'BluetoothOffScreen.dart';

class Tela2 extends StatefulWidget {
  @override
  _Tela2State createState() => _Tela2State();
}

class _Tela2State extends State<Tela2> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, //Orientação do dispositivo: para cima (não é possivel "deitar" o celular)
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Tira o banner do debug
      color: Colors.lightGreenAccent[100],
      home: StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown, //inicialmente o estado do bluetooth é desconhecido
          builder: (c, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.on) {  // se bluetooth estiver ligado no dispositivo, então vai para o arquivo Tela3_FindDevicesScreen.dart
              return Tela3();
            }
            return BluetoothOffScreen(state: state); // se o bluetooth não estiver ligado, então vai para o arquivo
            // BluetoohOffScreen.dart até que o usuário ligue o bluetooth.
            // Quando ativar, vai para Tela3_FindDevicesScreen.dart
          }),
    );
  }
}