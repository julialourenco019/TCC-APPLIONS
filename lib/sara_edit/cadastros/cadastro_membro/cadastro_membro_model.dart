import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'cadastro_membro_widget.dart' show CadastroMembroWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroMembroModel extends FlutterFlowModel<CadastroMembroWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  DateTime? datePicked;
  // State field(s) for TextField_NOME widget.
  FocusNode? textFieldNOMEFocusNode;
  TextEditingController? textFieldNOMETextController;
  String? Function(BuildContext, String?)? textFieldNOMETextControllerValidator;
  // State field(s) for TextField_EMAIL widget.
  FocusNode? textFieldEMAILFocusNode;
  TextEditingController? textFieldEMAILTextController;
  String? Function(BuildContext, String?)?
      textFieldEMAILTextControllerValidator;
  // State field(s) for TextField_CPF widget.
  FocusNode? textFieldCPFFocusNode;
  TextEditingController? textFieldCPFTextController;
  final textFieldCPFMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? textFieldCPFTextControllerValidator;
  // State field(s) for TextField_TELE widget.
  FocusNode? textFieldTELEFocusNode;
  TextEditingController? textFieldTELETextController;
  final textFieldTELEMask = MaskTextInputFormatter(mask: '(##) #####-####');
  String? Function(BuildContext, String?)? textFieldTELETextControllerValidator;
  // State field(s) for DropDown_EstCivil widget.
  String? dropDownEstCivilValue;
  FormFieldController<String>? dropDownEstCivilValueController;
  // State field(s) for DropDown_Work widget.
  String? dropDownWorkValue;
  FormFieldController<String>? dropDownWorkValueController;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<MembrosRow>? membroExiste;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<MembrosRow>? membroExiste2;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<MembrosRow>? membroExiste3;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<MembrosRow>? membroExiste4;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<AdminMembroRow>? membroExiste5;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  MembrosRow? membroCadastrado;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldNOMEFocusNode?.dispose();
    textFieldNOMETextController?.dispose();

    textFieldEMAILFocusNode?.dispose();
    textFieldEMAILTextController?.dispose();

    textFieldCPFFocusNode?.dispose();
    textFieldCPFTextController?.dispose();

    textFieldTELEFocusNode?.dispose();
    textFieldTELETextController?.dispose();
  }
}
