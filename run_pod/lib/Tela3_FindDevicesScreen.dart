import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'Tela4_InserirAltura.dart';
import 'dart:async';
import 'widgets.dart';

// Tela em que procura dispositivos para conectar por bluetooth
class Tela3 extends StatelessWidget {
  final device;
  const Tela3({Key key, this.device}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[100],//cor do fundo
      //Parte de cima da tela
      appBar: AppBar(
        title: Text("Escolha o aparelho Run Pod:",textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0)),
        backgroundColor: Colors.lightGreenAccent,
        elevation: 0,
      ),

      body: RefreshIndicator(
        onRefresh: () =>
            FlutterBlue.instance.startScan(timeout: Duration(seconds: 4)), //Começa a escanear os dispositivos por 4s

        child: SingleChildScrollView(

          child: Column(
            children: <Widget>[

              StreamBuilder<List<BluetoothDevice>>( //Widget que se constrói com base nas informações que recebe.
                // No caso, é sobre dispositivos que já estão conectados
                stream: Stream.periodic(Duration(seconds: 2))
                    .asyncMap((_) => FlutterBlue.instance.connectedDevices),
                initialData: [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data
                      .map((d) => ListTile(
                    title: Text(d.name), //Aparece o nome do dispositivo
                    //  subtitle: Text(d.id.toString()),
                    trailing: StreamBuilder<BluetoothDeviceState>(
                      stream: d.state, //estado do dispositivo
                      initialData: BluetoothDeviceState.connecting, //dados iniciais: o dispositivo está conectando
                      builder: (c, snapshot) {
                        if (snapshot.data == BluetoothDeviceState.connected) { //se o celular já estiver conectado com um
                          // dispositivo, aparecerá esse dispositivo na tela
                          // como primeira opção e com o botão escrito "abrir".
                          // Ao clicar, vai para TelaAbrir.dart.
                          //BOTÃO
                          return RaisedButton(
                            color: Colors.lightGreenAccent[100], //cor botão
                            child: Text(' Conectar novamente'),
                            textColor: Colors.white, //cor texto
                            onPressed: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Tela4(device: d))), //Manda a variável d para TelaAbrir.dart
                          );
                        }

                        return Text(snapshot.data.toString());
                      },
                    ),
                  ))
                      .toList(),
                ),
              ),

              StreamBuilder<List<ScanResult>>( //Aparece os resultados do escaneamento de dispositivos.
                // Utiliza widgets.dart para mostrar o nome dos
                // dispositivos e o botão de conectar.
                stream: FlutterBlue.instance.scanResults,
                initialData: [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data
                      .map(
                        (r) => ScanResultTile(
                      result: r,
                      //Se apertado, conecta com o dispositivo e vai para TelaAbrir.dart
                      onTap: () => Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        r.device.connect(); //conecta com o dispositivo
                        return Tela4(device: r.device); //Manda a a variável device para TelaAbrir.dart
                      })),

                    ),
                  )
                      .toList(),
                ),
              ),

            ],
          ),
        ),
      ),

      //BOTÃO QUE REINICIA O ESCANEAMENTO DOS DISPOSITIVOS DISPONÍVEIS E TAMBÉM FAZ ELE PARAR
      floatingActionButton: StreamBuilder<bool>(
        stream: FlutterBlue.instance.isScanning,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data) { //Enquanto está escanenado, o botão é vermelho com o ícone de parar.
            // Ao ser clicado ele para de escanear.
            return FloatingActionButton(
              child: Icon(Icons.stop),
              onPressed: () => FlutterBlue.instance.stopScan(),
              backgroundColor: Colors.red,
            );
          } else { //Se não estiver escaneando, o botão é branco com o ícone de lupa. Ao ser clicado, ele começa a escanear
            return FloatingActionButton(
                child: Icon(Icons.search, color: Colors.lightGreenAccent[100]),
                backgroundColor: Colors.black,
                onPressed: () => FlutterBlue.instance.startScan(timeout: Duration(seconds: 4)));
          }
        },
      ),
    );
  }
}