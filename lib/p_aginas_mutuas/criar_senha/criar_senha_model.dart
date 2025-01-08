import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'criar_senha_widget.dart' show CriarSenhaWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CriarSenhaModel extends FlutterFlowModel<CriarSenhaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Id_Login widget.
  FocusNode? idLoginFocusNode1;
  TextEditingController? idLoginTextController1;
  String? Function(BuildContext, String?)? idLoginTextController1Validator;
  // State field(s) for Id_Login widget.
  FocusNode? idLoginFocusNode2;
  TextEditingController? idLoginTextController2;
  final idLoginMask2 = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? idLoginTextController2Validator;
  // State field(s) for password_Login widget.
  FocusNode? passwordLoginFocusNode1;
  TextEditingController? passwordLoginTextController1;
  late bool passwordLoginVisibility1;
  String? Function(BuildContext, String?)?
      passwordLoginTextController1Validator;
  // State field(s) for password_Login widget.
  FocusNode? passwordLoginFocusNode2;
  TextEditingController? passwordLoginTextController2;
  late bool passwordLoginVisibility2;
  String? Function(BuildContext, String?)?
      passwordLoginTextController2Validator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<MembrosRow>? cpfbuscado;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<MembrosRow>? membrosenha2;

  @override
  void initState(BuildContext context) {
    passwordLoginVisibility1 = false;
    passwordLoginVisibility2 = false;
  }

  @override
  void dispose() {
    idLoginFocusNode1?.dispose();
    idLoginTextController1?.dispose();

    idLoginFocusNode2?.dispose();
    idLoginTextController2?.dispose();

    passwordLoginFocusNode1?.dispose();
    passwordLoginTextController1?.dispose();

    passwordLoginFocusNode2?.dispose();
    passwordLoginTextController2?.dispose();
  }
}
