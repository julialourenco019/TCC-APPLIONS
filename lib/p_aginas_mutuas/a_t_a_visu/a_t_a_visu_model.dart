import '/flutter_flow/flutter_flow_util.dart';
import 'a_t_a_visu_widget.dart' show ATAVisuWidget;
import 'package:flutter/material.dart';

class ATAVisuModel extends FlutterFlowModel<ATAVisuWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Titulo widget.
  FocusNode? tituloFocusNode;
  TextEditingController? tituloTextController;
  String? Function(BuildContext, String?)? tituloTextControllerValidator;
  // State field(s) for Local widget.
  FocusNode? localFocusNode;
  TextEditingController? localTextController;
  String? Function(BuildContext, String?)? localTextControllerValidator;
  // State field(s) for Data widget.
  FocusNode? dataFocusNode;
  TextEditingController? dataTextController;
  String? Function(BuildContext, String?)? dataTextControllerValidator;
  // State field(s) for Hora widget.
  FocusNode? horaFocusNode;
  TextEditingController? horaTextController;
  String? Function(BuildContext, String?)? horaTextControllerValidator;
  // State field(s) for Descricao widget.
  FocusNode? descricaoFocusNode;
  TextEditingController? descricaoTextController;
  String? Function(BuildContext, String?)? descricaoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tituloFocusNode?.dispose();
    tituloTextController?.dispose();

    localFocusNode?.dispose();
    localTextController?.dispose();

    dataFocusNode?.dispose();
    dataTextController?.dispose();

    horaFocusNode?.dispose();
    horaTextController?.dispose();

    descricaoFocusNode?.dispose();
    descricaoTextController?.dispose();
  }
}
