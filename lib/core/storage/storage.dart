// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names
import 'package:hive_flutter/hive_flutter.dart';
import 'package:swappid/core/storage/database.dart';

late Box mainStg;
late Box settingsStg;

initStorage() async {
  await Hive.initFlutter();
  mainStg = await Hive.openBox(DB.MAIN_BOX);
  settingsStg = await Hive.openBox(DB.SETTINGS_BOX);
}

getStorage({required String path, temp}) {
  if (temp != null) {
    return mainStg.get(path, defaultValue: temp);
  }
  return mainStg.get(path);
}

setStorage({required String key, required value}) {
  return mainStg.put(key, value);
}

getSettings({required String path}) {
  return settingsStg.get(path);
}

setSettings({required String key, required value}) {
  return settingsStg.put(key, value);
}

clearData(List<String> keys) async {
  return await mainStg.deleteAll(keys);
}

deleteKey(List<String> keys) {
  for (String key in keys) {
    mainStg.delete(key);
  }
}

clearAll() {
  mainStg.clear();
  settingsStg.clear();
}

clearMain() {
  mainStg.clear();
}
