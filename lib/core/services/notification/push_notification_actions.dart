import 'package:flutter/material.dart';

class PushNotificationActions <T> {
  BuildContext context;
  String? action;
  T? data;

  PushNotificationActions({required this.context, this.action, this.data});
  onAction() {
    if (action == "View Message") {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsScreen(orderId: data?.id)));
    }
  }
  
}