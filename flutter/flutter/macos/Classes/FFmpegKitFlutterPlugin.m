// FFmpegKitFlutterPlugin.m (Stubbed version)

#import "FFmpegKitFlutterPlugin.h"

@implementation FFmpegKitFlutterPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter.arthenica.com/ffmpeg_kit"
            binaryMessenger:[registrar messenger]];
  FFmpegKitFlutterPlugin* instance = [[FFmpegKitFlutterPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  result([FlutterError errorWithCode:@"UNAVAILABLE"
                             message:@"FFmpegKit is not available on iOS"
                             details:nil]);
}

@end