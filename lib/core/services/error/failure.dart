import 'package:swappid/core/helper/enums.dart';

class Failure {
  final String? title;
  final String message;
  final ErrorTypes type;

  Failure(
    this.message, {
    this.title,
    required this.type,
  });
}
