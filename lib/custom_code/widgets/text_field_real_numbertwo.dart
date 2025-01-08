// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

class TextFieldRealNumbertwo extends StatefulWidget {
  const TextFieldRealNumbertwo({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _TextFieldRealNumberState createState() => _TextFieldRealNumberState();
}

class _TextFieldRealNumberState extends State<TextFieldRealNumbertwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
            child: TextField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CentavosInputFormatter(casasDecimais: 2, moeda: true)
              ],
              autofocus: false,
              obscureText: false,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              style: FlutterFlowTheme.of(context).bodyMedium,
              decoration: InputDecoration(
                labelText: FFAppState().ttamount,
                hintText: FFAppState().ttamount,
                hintStyle: FlutterFlowTheme.of(context).bodySmall,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).yellow,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).yellow,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              ),
              onChanged: (tamount) {
                setState(() {
                  FFAppState().tamount =
                      UtilBrasilFields.converterMoedaParaDouble(tamount);
                });
              },
            )));
  }
}
