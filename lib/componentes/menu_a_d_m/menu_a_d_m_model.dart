import '/componentes/mode_a_d_m/mode_a_d_m_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'menu_a_d_m_widget.dart' show MenuADMWidget;
import 'package:flutter/material.dart';

class MenuADMModel extends FlutterFlowModel<MenuADMWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for modeADM component.
  late ModeADMModel modeADMModel;

  @override
  void initState(BuildContext context) {
    modeADMModel = createModel(context, () => ModeADMModel());
  }

  @override
  void dispose() {
    modeADMModel.dispose();
  }
}
