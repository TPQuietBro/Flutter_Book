import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativePlugin {
  static const MethodChannel _channel =
      const MethodChannel('native_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<Map> get datas async {
    final Map data = await _channel.invokeMethod('getData');
    return data;
  } 

  static Future get orinData async {
    var _orinData = await _channel.invokeMethod('getOringinData');
    return _orinData;
  } 
}
