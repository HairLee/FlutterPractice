import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TestImageLoader extends StatelessWidget {
  final String title;
  TestImageLoader({this.title});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(title),
      ),
      body:
      new SingleChildScrollView(child:
      new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new CircularProgressIndicator(),
            _sizedContainer(
              new Image(
                image: new CachedNetworkImageProvider("https://dantricdn.com/thumb_w/640/2018/3/14/hot-girl-anh-the-huong-le-xe-buyt8-15210195344091865692058.jpg"),
              ),
            ),

            _sizedContainer(
              new CachedNetworkImage(
                imageUrl: "http://via.placeholder.com/200x150",
              ),
            ),

            _sizedContainer(
              new CachedNetworkImage(
                imageUrl: "not a valid uri",
                placeholder: new CircularProgressIndicator(),
                errorWidget: new Icon(Icons.error),
              ),
            ),

            _sizedContainer(
              new CachedNetworkImage(
                imageUrl: "http://via.placeholder.com/350x200",
                placeholder: new CircularProgressIndicator(),
                errorWidget: new Icon(Icons.error),
                fadeOutDuration: new Duration(seconds: 1),
                fadeInDuration: new Duration(seconds: 3),
              ),
            ),

          ],
        ),
      ),
      ),
    );
  }

  Widget _sizedContainer(Widget child) {
    return new SizedBox(
      width: 300.0,
      height: 150.0,
      child: new Center(
        child: child,
      ),
    );
  }
}