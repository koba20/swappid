import 'package:swappid/core/api/api_base.dart';
import 'package:swappid/core/helper/enums.dart';
import 'package:swappid/core/storage/dispatch.dart';

Map<String, String> get headers {
  return {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    if (getToken != null) 'Authorization': 'Bearer ${getToken?.access}'
  };
}

Map<String, String> get headersSocket {
  return {
    'Sec-WebSocket-Version': '13',
    'Connection': 'Upgrade',
    'Upgrade': 'websocket',
    'origin': environment == Environment.development
        ? 'http://127.0.0.1:8080'
        : originUrl,
  };
}
