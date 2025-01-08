import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editar_membro_widget.dart' show EditarMembroWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditarMembroModel extends FlutterFlowModel<EditarMembroWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in EditarMembro widget.
  List<MembrosRow>? iDExistee;
  // State field(s) for TextField_NOME widget.
  FocusNode? textFieldNOMEFocusNode;
  TextEditingController? textFieldNOMETextController;
  String? Function(BuildContext, String?)? textFieldNOMETextControllerValidator;
  // State field(s) for TextField_EMAIL widget.
  FocusNode? textFieldEMAILFocusNode;
  TextEditingController? textFieldEMAILTextController;
  String? Function(BuildContext, String?)?
      textFieldEMAILTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController3;
  final textFieldMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField_TELE widget.
  FocusNode? textFieldTELEFocusNode;
  TextEditingController? textFieldTELETextController;
  final textFieldTELEMask = MaskTextInputFormatter(mask: '(##) #####-####');
  String? Function(BuildContext, String?)? textFieldTELETextControllerValidator;
  // State field(s) for DropDown_Work widget.
  String? dropDownWorkValue;
  FormFieldController<String>? dropDownWorkValueController;
  // State field(s) for DropDown_Status widget.
  String? dropDownStatusValue;
  FormFieldController<String>? dropDownStatusValueController;
  DateTime? datePicked;
  // State field(s) for TextField_ID widget.
  FocusNode? textFieldIDFocusNode;
  TextEditingController? textFieldIDTextController;
  String? Function(BuildContext, String?)? textFieldIDTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in TextField_ID widget.
  List<MembrosRow>? iDExiste;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<MembrosRow>? membroTele;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<MembrosRow>? membroExiste2;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<MembrosRow>? membroExiste3;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<MembrosRow>? membroExiste4;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<MembrosRow>? editarID;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<AdminMembroRow>? idGuia;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldNOMEFocusNode?.dispose();
    textFieldNOMETextController?.dispose();

    textFieldEMAILFocusNode?.dispose();
    textFieldEMAILTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController3?.dispose();

    textFieldTELEFocusNode?.dispose();
    textFieldTELETextController?.dispose();

    textFieldIDFocusNode?.dispose();
    textFieldIDTextController?.dispose();
  }
}
