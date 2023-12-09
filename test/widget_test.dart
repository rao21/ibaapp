import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:ibaapp/main.dart';

void main() async {

  setUpAll(() => {loadAppFonts()});
  testGoldens('DeviceBuilder - multiple scenarios - with onCreate',
      (tester) async {

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device.tabletPortrait,
        Device.tabletLandscape,
      ])
      ..addScenario(
        widget: const MyApp(),
        name: 'sc page',
      );
    //flutter test --update-goldens
    await tester.pumpDeviceBuilder(
      builder,
      wrapper: materialAppWrapper(
        theme: ThemeData.light(),
        platform: TargetPlatform.android,
      ),
    );

    await screenMatchesGolden(tester, 'firt_screen_shot');
  });
}
