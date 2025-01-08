import '/flutter_flow/flutter_flow_util.dart';
import 'alterar_foto_widget.dart' show AlterarFotoWidget;
import 'package:flutter/material.dart';

class AlterarFotoModel extends FlutterFlowModel<AlterarFotoWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
