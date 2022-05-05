import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class MyHomePageState extends StatefulWidget {
  @override
  _MyHomePageStateState createState() => _MyHomePageStateState();
}

class _MyHomePageStateState extends State<MyHomePageState> {
  //The client and host sides of a channel are connected through a channel
  // name passed in the channel constructor.
  // All channel names used in a single app must be unique;
  // prefix the channel name with a unique ‘domain prefix’,
  // for example: samples.flutter.dev/battery.
  static const platform = const MethodChannel('samples.flutter.dev/battery');
  //get the battery level
  //Next, invoke a method on the method channel, specifying the concrete method
  // to call using the String identifier getBatteryLevel.
  // The call might fail—for example if the platform does not support the
  // platform API (such as when running in a simulator)—so wrap the
  // invokeMethod call in a try-catch statement.
  var _batteryLevel = 'Unknown battery level';
  Future<void> _getBatteryLevel() async {
    String batterLevel;
    try{
      //you invoke the method as string
      final int result = await platform.invokeMethod('getBatteryLevel');
      batterLevel = 'Battery level at $result %.';
    } on PlatformException catch (e) {
      batterLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {
      _batteryLevel = batterLevel;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Platform Specific Code"),
      ),
      body: Material(
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: _getBatteryLevel, child: Text('Get Battery Level')),
            Text(_batteryLevel)
          ],
        ),
      ),
      )
    );
  }
}
