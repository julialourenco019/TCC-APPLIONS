import '/componentes/mode/mode_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'perfil_a_d_m_widget.dart' show PerfilADMWidget;
import 'package:flutter/material.dart';

class PerfilADMModel extends FlutterFlowModel<PerfilADMWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for mode component.
  late ModeModel modeModel;

  @override
  void initState(BuildContext context) {
    modeModel = createModel(context, () => ModeModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    modeModel.dispose();
  }
}
