import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:protobuf/protobuf.dart';
class UDPSocketTest extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {


    return new UDPSocketTestState();
  }
}

void makeProtoBuffile(){

}


void _submit() {
  print('Try to connect to the server to get Data');
  RawDatagramSocket
      .bind(InternetAddress.ANY_IP_V4, 9000)
      .then((RawDatagramSocket s) {
    s.joinMulticast(new InternetAddress("35.185.186.230"));
    s.listen((RawSocketEvent e) {
      final dg = s.receive();
      if (dg == null) {
        print("Data null");
        return;
      }
      var codec = new Utf8Codec();
      final mess = codec.decode(dg.data);
      print("Received $mess!");
    });
  });
}

void tryToSenData(List<String> args){
  
  RawDatagramSocket.bind(InternetAddress.ANY_IP_V4, 4444).then((RawDatagramSocket socket){
    print('UDP Echo ready to receive');
    print('${socket.address.address}:${socket.port}');
    socket.listen((RawSocketEvent e){
      Datagram d = socket.receive();
      if (d == null) return;

      String message = new String.fromCharCodes(d.data);
      print('Datagram from ${d.address.address}:${d.port}: ${message.trim()}');

      socket.send(message.codeUnits, d.address, d.port);
    });
  });
}

void tryToSendDataWithTimer(){

  InternetAddress multicastAddress = new InternetAddress('35.185.186.230');
  int multicastPort = 9000;
  Random rng = new Random();
  RawDatagramSocket.bind(InternetAddress.ANY_IP_V4, 0).then((RawDatagramSocket s) {
    print("UDP Socket ready to send to group "
        "${multicastAddress.address}:${multicastPort}");

    new Timer.periodic(new Duration(seconds: 1), (Timer t) {
      //Send a random number out every second
      String msg = '${rng.nextInt(1000)}';
      stdout.write("Sending $msg  \r");
      s.send('$msg\n'.codeUnits, multicastAddress, multicastPort);
    });
  });
}

class UDPSocketTestState extends State<UDPSocketTest>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        body: Center(child: new RaisedButton(onPressed: (){
          _submit();
        })),
      ),

    );
  }

}