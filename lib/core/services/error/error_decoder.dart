String decodeError(dynamic message) {
  if (message is Map) {
    final value = message.entries.first.value;

    if (value is List) {
      return value.first;
    } else {
      return value;
    }
  } else if (message is String) {
    return message;
  } else {
    return 'Unknown Error';
  }
}

// Future<dynamic> showErrorMessage(
//   BuildContext context,
//   String message, {
//   String? title,
// }) async {
//   return await showDialog(
//     context: context,
//     builder: (context) => AppDialog(
//       state: PopupState.error,
//       onAccept: () => Navigator.pop(context),
//       message: message,
//     ),
//   );
// }
