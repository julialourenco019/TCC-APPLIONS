// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future sendMeetingNotification2(
  String? meetingDate,
  String? meetingLocation,
) async {
  // enviar notificação com data, hora e local

  // Implement code to send notification with meeting details
  // For example, using flutter_local_notifications package

  // Initialize the notification plugin
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Configure the Android initialization settings
  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  // Configure the initialization settings for the FlutterLocalNotificationsPlugin
  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: null,
    macOS: null,
  );

  // Initialize the FlutterLocalNotificationsPlugin with the initialization settings
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Configure the notification details
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );

  // Configure the notification
  var notificationDetails = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: null,
    macOS: null,
  );

  // Show the notification
  await flutterLocalNotificationsPlugin.show(
    0,
    meetingDate ?? '', // Use title parameter here
    meetingLocation ?? '', // Use content parameter here
    notificationDetails,
    payload: 'item x',
  );
}
