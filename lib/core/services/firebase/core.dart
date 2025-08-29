import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_installations/firebase_installations.dart';

class FirebaseCore {
  static create() async {
    await Firebase.initializeApp();
  }

  static Future<String> getInstallationId() async {
    final installationId = await FirebaseInstallations.id;
    return installationId ?? '';
  }
}
