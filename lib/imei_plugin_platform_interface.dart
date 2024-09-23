import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'imei_plugin_method_channel.dart';

abstract class ImeiPluginPlatform extends PlatformInterface {
  /// Constructs a ImeiPluginPlatform.
  ImeiPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static ImeiPluginPlatform _instance = MethodChannelImeiPlugin();

  /// The default instance of [ImeiPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelImeiPlugin].
  static ImeiPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ImeiPluginPlatform] when
  /// they register themselves.
  static set instance(ImeiPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
