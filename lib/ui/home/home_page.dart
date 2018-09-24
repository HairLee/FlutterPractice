import 'package:flutter/material.dart';
import 'package:protobuf/protobuf.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}



class HomePageState extends State<HomePage> {




var form = new Scaffold(

  body: Container(
    child: ListView.builder(itemCount: 20,itemBuilder: (BuildContext context, int i){

      return Center(child: Container(child: i%2 == 0 ? Container(child: SizedBox(height: 40.0,width: double.infinity,),decoration: BoxDecoration(color: Colors.deepOrangeAccent)) : Container(child: SizedBox(child: const Card(child: const Text('Hello World!')),height: 40.0,width: double.infinity,),decoration: BoxDecoration(color: Colors.blue)) )) ;

    }),
  ),
);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Home"),
        actions: <Widget>[
          new Icon(Icons.accessibility)
        ],
      ),
      body: form
    );
  }

}