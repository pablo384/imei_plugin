import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'imei_plugin_platform_interface.dart';

/// An implementation of [ImeiPluginPlatform] that uses method channels.
class MethodChannelImeiPlugin extends ImeiPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('imei_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
