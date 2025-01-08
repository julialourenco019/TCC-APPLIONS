import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editar_ingresso_widget.dart' show EditarIngressoWidget;
import 'package:flutter/material.dart';

class EditarIngressoModel extends FlutterFlowModel<EditarIngressoWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in EditarIngresso widget.
  List<IngressosRow>? iDAcIngresso;
  // State field(s) for TextField_Quantidade widget.
  FocusNode? textFieldQuantidadeFocusNode;
  TextEditingController? textFieldQuantidadeTextController;
  String? Function(BuildContext, String?)?
      textFieldQuantidadeTextControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - Delete Row(s)] action in Button widget.
  List<IngressosRow>? deletado;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<IngressosRow>? editIngressoID;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<IngressosRow>? updateingresso;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldQuantidadeFocusNode?.dispose();
    textFieldQuantidadeTextController?.dispose();
  }
}
