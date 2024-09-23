import 'package:flutter_test/flutter_test.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:imei_plugin/imei_plugin_platform_interface.dart';
import 'package:imei_plugin/imei_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockImeiPluginPlatform
    with MockPlatformInterfaceMixin
    implements ImeiPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ImeiPluginPlatform initialPlatform = ImeiPluginPlatform.instance;

  test('$MethodChannelImeiPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelImeiPlugin>());
  });

  test('getPlatformVersion', () async {
    ImeiPlugin imeiPlugin = ImeiPlugin();
    MockImeiPluginPlatform fakePlatform = MockImeiPluginPlatform();
    ImeiPluginPlatform.instance = fakePlatform;

    expect(await imeiPlugin.getPlatformVersion(), '42');
  });
}
