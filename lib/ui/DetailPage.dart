import 'package:flutter/material.dart';


class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DetailPageCell();
  }
}

class DetailPageCell extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    new Text("Ambition"), new Text("Condition Yes")

                  ],

                ),

              ), new Row(

                children: <Widget>[

                  new Icon(Icons.ac_unit),
                  new Container(height: 0.0, width: 50.0,),
                  new Icon(Icons.accessibility),

                ],

              ),   new Icon(Icons.update), new Divider()



            ],


          ));
        }),
      ),
    );;
  }
}