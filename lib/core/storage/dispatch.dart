import 'package:swappid/core/storage/database.dart';
import 'package:swappid/core/storage/storage.dart';
import 'package:swappid/features/authentication/data/models/token/token.dart';
import 'package:swappid/features/user/data/models/users/users.dart';

bool isFirstTime() {
  final isFirst = getSettings(path: DB.FIRST_TIME);
  if (isFirst == null) {
    return true;
  }
  return false;
}

User? get getUser {
  final data = getStorage(path: DB.USER);
  if (data == null) return null;
  return User.fromJson(data);
}

Token? get getToken {
  final data = getStorage(path: DB.TOKENS);
  if (data == null) return null;
  return Token.fromJson(data);
}
