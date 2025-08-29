import 'package:flutter/material.dart';
import 'package:swappid/app.dart';
import 'package:swappid/core/api/api_base.dart';
import 'package:swappid/core/config/config.dart';
import 'package:swappid/core/config/config.device.dart';
import 'package:swappid/core/helper/enums.dart';
import 'package:swappid/core/services/firebase/core.dart';
import 'package:swappid/core/storage/storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init storage
  await initStorage();

  // init config
  await AppConfig.instance.init();
  await ConfigDevice.instance.init();

  // Firebase
  await FirebaseCore.create();

  // init api config
  initApi(Environment.staging);

  // init App
  runApp(const SwappidApp());
}
