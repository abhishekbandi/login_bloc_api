import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class Welcom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        centerTitle: true,
      ),
      body: Container(
        child: RaisedButton(
          onPressed: (){
            if(Platform.isAndroid){
              print("Android");
            }
            else
            if(Platform.isIOS)
            {
              print("IOS");
            }
          },
        ),
      ),
    );
  }
}
