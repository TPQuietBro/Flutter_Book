#import "NativePlugin.h"

@implementation NativePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"native_plugin"
            binaryMessenger:[registrar messenger]];
  NativePlugin* instance = [[NativePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"getData" isEqualToString:call.method]) {
      result(@{@"code" : @(1),@"anyData" : @"this is data"});
  } else if ([@"getOringinData" isEqualToString:call.method]) {
      NSData *data = [@"唐鹏" dataUsingEncoding:NSUTF8StringEncoding];
      FlutterStandardTypedData *_data = [FlutterStandardTypedData typedDataWithBytes:data];
      result(_data);
  } else {
      result(FlutterMethodNotImplemented);
  }
}

@end
