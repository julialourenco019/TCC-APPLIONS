import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'editar_event_widget.dart' show EditarEventWidget;
import 'package:flutter/material.dart';

class EditarEventModel extends FlutterFlowModel<EditarEventWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in EditarEvent widget.
  List<EventosRow>? iDAceito;
  // State field(s) for TextField_NOME widget.
  FocusNode? textFieldNOMEFocusNode;
  TextEditingController? textFieldNOMETextController;
  String? Function(BuildContext, String?)? textFieldNOMETextControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TextField_DETALHE widget.
  FocusNode? textFieldDETALHEFocusNode;
  TextEditingController? textFieldDETALHETextController;
  String? Function(BuildContext, String?)?
      textFieldDETALHETextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<EventosRow>? destivo;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<IngressosRow>? fase;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<EventosRow>? ativo;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<IngressosRow>? tru;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<EventosRow>? editarEventoID;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<EventosRow>? iDAceito2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldNOMEFocusNode?.dispose();
    textFieldNOMETextController?.dispose();

    textFieldDETALHEFocusNode?.dispose();
    textFieldDETALHETextController?.dispose();
  }
}
