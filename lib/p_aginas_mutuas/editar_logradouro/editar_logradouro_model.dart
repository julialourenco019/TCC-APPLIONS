import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editar_logradouro_widget.dart' show EditarLogradouroWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditarLogradouroModel extends FlutterFlowModel<EditarLogradouroWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for cep widget.
  FocusNode? cepFocusNode;
  TextEditingController? cepTextController;
  final cepMask = MaskTextInputFormatter(mask: '#####-###');
  String? Function(BuildContext, String?)? cepTextControllerValidator;
  // Stores action output result for [Backend Call - API (BuscarCep)] action in IconButton widget.
  ApiCallResponse? apiResultr4i;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<MembrosRow>? updateLogradouro;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cepFocusNode?.dispose();
    cepTextController?.dispose();
  }
}
