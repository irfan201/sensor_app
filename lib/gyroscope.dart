

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() => runApp(gyroscope());

@override
class gyroscope extends StatelessWidget {
  @override
  const gyroscope({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gyroscope',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Sensor'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>{

  double dx = 100, dy = 100;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<GyroscopeEvent>(
        stream: SensorsPlatform.instance.gyroscopeEvents,
        builder: (_, snapshot){
          if(snapshot.hasData){
            dx = dx + snapshot.data!.y*10;
            dy = dy + snapshot.data!.x*10;
          }

          return Transform.translate(offset: Offset(dx,dy),
          child: const CircleAvatar(radius: 20,));
        },
      )
    );
  }
}

