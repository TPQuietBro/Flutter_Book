import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:native_plugin/native_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await NativePlugin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Map _data;
  Future<void> _getDataFromOc() async {
    Map data;
    try {
      data = await NativePlugin.datas;
    } on PlatformException {
      data = {"code": 1};
    }
    if (!mounted) return;

    setState(() {
      _data = data;
    });
  }

  String _orinData;
  Future _getOriData() async {
    Uint8List oriData;
    try {
      oriData = await NativePlugin.orinData;
    } on PlatformException {
      oriData = null;
    }
    if (!mounted) {
      return;
    }
    setState(() {
      // _orinData = String.fromCharCodes(oriData);
      _orinData = Utf8Decoder().convert(oriData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Text('Running on: $_platformVersion\n'),
            Text('data is: $_data\n'),
            Text('oriData is : $_orinData.'),
            MaterialButton(
              child: Text('click me'),
              onPressed: () {
                _getOriData();
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _getDataFromOc();
          },
        ),
      ),
    );
  }
}
