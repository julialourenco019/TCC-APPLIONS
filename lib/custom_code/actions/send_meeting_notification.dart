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
// and then add the boilerplate code using the green button on the right

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> sendMeetingNotification(
  String? meetingDate,
  String? meetingTime,
  String? meetingLocation,
) async {
  // Configura valores padrão para os parâmetros, caso sejam nulos
  final String title = "Reunião Agendada";
  final String body = "Data: ${meetingDate ?? 'Indefinida'}"
      "\Hora: ${meetingTime ?? 'Indefinida'}"
      "\nLocal: ${meetingLocation ?? 'Indefinido'}";

  // Inicializar o plugin de notificações
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Configurações para Android
  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  // Inicialização para multiplataformas (somente Android configurado aqui)
  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  // Inicializa o plugin
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Configura os detalhes da notificação no Android
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'channel_id', // ID do canal (único para o app)
    'Reuniões', // Nome do canal
    channelDescription: 'Notificações para reuniões agendadas',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );

  // Configura os detalhes da notificação
  var notificationDetails = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  // Exibe a notificação
  await flutterLocalNotificationsPlugin.show(
    0, // ID único para a notificação
    title, // Título da notificação
    body, // Corpo da notificação
    notificationDetails, // Configurações de notificação
    payload: 'Reunião', // Opcional: dados extras
  );
}
