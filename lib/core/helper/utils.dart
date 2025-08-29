import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:logger/web.dart';

class Utils {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static String fileToBase64(String path) {
    final bytes = File(path).readAsBytesSync();
    return "data:image/jpeg;base64,${base64Encode(bytes)}";
  }
}


// Logger
final Logger mLog = Logger(printer: PrettyPrinter());
