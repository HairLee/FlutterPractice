import 'package:flutter/material.dart';


class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Detail page"),
      ),
      body: new Center(
        child: new ListView.builder(itemCount: 100,itemBuilder: (context,i){

          return new FlatButton(onPressed: (){

            print("Click $i");
          }, child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(

              child: new Text("Ambition $i",style: new TextStyle(fontSize: 15.0),),
              ), new Divider()



            ],


          ));
        }),
      ),
    );
  }
}