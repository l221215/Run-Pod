import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'dart:convert'show utf8;

//FUNÇÕES DO BLUETOOTH
// função
void ligar(){
}

//Função que para os movimento
void desligar() {
}

//Função que liga o movimento de sucção
String receberEsp(final device) {
  BluetoothCharacteristic characteristic;
  String Valor = "";
  final String SERVICE_UUID = "ab0828b1-198e-4351-b779-901fa0e0371e"; //identificador do serviço do esp32
  final String CHARACTERISTIC_UUID = "fbed8ddc-109f-11eb-adc1-0242ac120002"; //identificador da caracteristica do esp32
  print('bbbbbbbbb');
  Future<Widget> discoverServices() async {
    print('cccccc');
    List<BluetoothService> services = await device.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == SERVICE_UUID) { //Se o service do esp32 que foi conectado agora for igual ao SERVICE_UUID.
        service.characteristics.forEach((characteristic) async {
          if (characteristic.uuid.toString() == CHARACTERISTIC_UUID) { //Se o characteristic do esp32 que foi
            // conectado agora for igual ao CHARACTERISTIC_UUID.
            print('dddddddd');
            characteristic = characteristic;
            //Valor = device.read(characteristic);
            print (characteristic.setNotifyValue(true));
        }
        });
      }
    }
    );
  }
  discoverServices();
  return Valor;
}

String texto1(){
  String Oi = "Oi";
  return Oi;
}

//Função que manda a mensagem
void MandarEsp(final device) {
  BluetoothCharacteristic characteristic;
  final String SERVICE_UUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b"; //identificador do serviço do esp32
  final String CHARACTERISTIC_UUID = "fbed8ddc-109f-11eb-adc1-0242ac120002"; //identificador da caracteristica do esp32
  Future<Widget> discoverServices() async {
    print('cccccc');

    List<BluetoothService> services = await device.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == SERVICE_UUID) { //Se o service do esp32 que foi conectado agora for igual ao SERVICE_UUID.
        service.characteristics.forEach((characteristic) async {
          if (characteristic.uuid.toString() == CHARACTERISTIC_UUID) { //Se o characteristic do esp32 que foi
            // conectado agora for igual ao CHARACTERISTIC_UUID.

            characteristic = characteristic;
            characteristic.write(utf8.encode ('abrir')); //Manda o valor "abrir" para esp32
          }
        });
      }
    });
  }
}

//Função que liga o movimento automático
void ligarAutomatico() {
}


//BLUETOOTH - Função que enumera os dispositivos
  Future<void> encontrarDispositivos(BuildContext context) async {
}

//BLUETOOTH - Função para selecionar o dispositvo
selecionarDispositivo(String deviceAddress, BuildContext context) {
}