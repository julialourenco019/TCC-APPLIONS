import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Id_Login widget.
  FocusNode? idLoginFocusNode;
  TextEditingController? idLoginTextController;
  String? Function(BuildContext, String?)? idLoginTextControllerValidator;
  // State field(s) for password_Login widget.
  FocusNode? passwordLoginFocusNode;
  TextEditingController? passwordLoginTextController;
  late bool passwordLoginVisibility;
  String? Function(BuildContext, String?)? passwordLoginTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<MembrosRow>? membroLogado;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<MembrosRow>? admLogado;
  // State field(s) for CPF_Tablet widget.
  FocusNode? cPFTabletFocusNode;
  TextEditingController? cPFTabletTextController;
  final cPFTabletMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cPFTabletTextControllerValidator;
  // State field(s) for password_Tablet widget.
  FocusNode? passwordTabletFocusNode;
  TextEditingController? passwordTabletTextController;
  late bool passwordTabletVisibility;
  final passwordTabletMask = MaskTextInputFormatter(mask: '####');
  String? Function(BuildContext, String?)?
      passwordTabletTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    passwordLoginVisibility = false;
    passwordTabletVisibility = false;
  }

  @override
  void dispose() {
    idLoginFocusNode?.dispose();
    idLoginTextController?.dispose();

    passwordLoginFocusNode?.dispose();
    passwordLoginTextController?.dispose();

    cPFTabletFocusNode?.dispose();
    cPFTabletTextController?.dispose();

    passwordTabletFocusNode?.dispose();
    passwordTabletTextController?.dispose();
  }
}
