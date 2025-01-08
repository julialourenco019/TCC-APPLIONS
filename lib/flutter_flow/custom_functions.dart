import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String? moneyFormat(double? real) {
  final format = NumberFormat("###,###.##");
  return format.format(real);
}

String applyPhoneMask(String input) {
  input = input.replaceAll(
      RegExp(r'[^0-9]'), ''); // Remove caracteres não numéricos
  if (input.length <= 10) {
    return '(${input.substring(0, 2)}) ${input.substring(2, 6)}-${input.substring(6)}';
  } else {
    return '(${input.substring(0, 2)}) ${input.substring(2, 7)}-${input.substring(7)}';
  }
}
