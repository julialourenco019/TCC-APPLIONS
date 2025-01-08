import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'editar_membro_model.dart';
export 'editar_membro_model.dart';

class EditarMembroWidget extends StatefulWidget {
  const EditarMembroWidget({super.key});

  @override
  State<EditarMembroWidget> createState() => _EditarMembroWidgetState();
}

class _EditarMembroWidgetState extends State<EditarMembroWidget> {
  late EditarMembroModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarMembroModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.iDExistee = await MembrosTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'IdMembro',
          FFAppState().IDMembroEDITAR,
        ),
      );
      if (_model.iDExistee?.length == 1) {
        await Future.wait([
          Future(() async {
            safeSetState(() {
              _model.textFieldNOMETextController?.text =
                  _model.iDExistee!.firstOrNull!.nome!;
            });
          }),
          Future(() async {
            safeSetState(() {
              _model.textFieldEMAILTextController?.text =
                  _model.iDExistee!.firstOrNull!.email!;
            });
          }),
          Future(() async {
            safeSetState(() {
              _model.textController3?.text =
                  _model.iDExistee!.firstOrNull!.cpf!;
              _model.textFieldMask.updateMask(
                newValue: TextEditingValue(
                  text: _model.textController3!.text,
                ),
              );
            });
          }),
          Future(() async {
            safeSetState(() {
              _model.textFieldTELETextController?.text =
                  _model.iDExistee!.firstOrNull!.telefone!;
              _model.textFieldTELEMask.updateMask(
                newValue: TextEditingValue(
                  text: _model.textFieldTELETextController!.text,
                ),
              );
            });
          }),
          Future(() async {
            safeSetState(() {
              _model.dropDownWorkValueController?.value =
                  _model.iDExistee!.firstOrNull!.adminMembro!;
            });
          }),
          Future(() async {
            safeSetState(() {
              _model.textFieldIDTextController?.text =
                  _model.iDExistee!.firstOrNull!.idMembro.toString();
            });
          }),
        ]);
      }
    });

    _model.textFieldNOMETextController ??= TextEditingController();
    _model.textFieldNOMEFocusNode ??= FocusNode();

    _model.textFieldEMAILTextController ??= TextEditingController();
    _model.textFieldEMAILFocusNode ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.textFieldTELETextController ??= TextEditingController();
    _model.textFieldTELEFocusNode ??= FocusNode();

    _model.textFieldIDTextController ??= TextEditingController();
    _model.textFieldIDFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 770.0,
              ),
              decoration: const BoxDecoration(),
            ),
          ),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 770.0,
            ),
            decoration: const BoxDecoration(),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'q8lgbqwf' /* Buscar Membro */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).fundo,
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 40.0,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 5.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'x2rxd6p6' /* Nome: */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).naveBar,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 5.0))
                        .addToEnd(const SizedBox(height: 5.0)),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 48.0,
                        constraints: const BoxConstraints(
                          maxHeight: 40.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).yellow,
                            width: 2.0,
                          ),
                        ),
                        child: SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _model.textFieldNOMETextController,
                            focusNode: _model.textFieldNOMEFocusNode,
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'vy8x4c8n' /* Nome */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            keyboardType: TextInputType.name,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model
                                .textFieldNOMETextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 5.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'vb10mv0z' /* Email: */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).naveBar,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 5.0))
                        .addToEnd(const SizedBox(height: 5.0)),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 48.0,
                        constraints: const BoxConstraints(
                          maxHeight: 40.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).yellow,
                            width: 2.0,
                          ),
                        ),
                        child: SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _model.textFieldEMAILTextController,
                            focusNode: _model.textFieldEMAILFocusNode,
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                '4nnut9mg' /* Email */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            textAlign: TextAlign.start,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model
                                .textFieldEMAILTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 5.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: FFLocalizations.of(context).getText(
                            'ou8p2k73' /* CPF: */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 5.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).naveBar,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 5.0))
                        .addToEnd(const SizedBox(height: 5.0)),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 25.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).yellow,
                            width: 2.0,
                          ),
                        ),
                        child: SizedBox(
                          width: 200.0,
                          child: TextFormField(
                            controller: _model.textController3,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                '6urwlppk' /* Cpf */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            keyboardType: TextInputType.number,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textController3Validator
                                .asValidator(context),
                            inputFormatters: [_model.textFieldMask],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 5.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: FFLocalizations.of(context).getText(
                            'xgay0bpb' /* Telefone: */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 5.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).naveBar,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 5.0))
                        .addToEnd(const SizedBox(height: 5.0)),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 25.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).yellow,
                            width: 2.0,
                          ),
                        ),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.textFieldTELETextController,
                                focusNode: _model.textFieldTELEFocusNode,
                                autofocus: false,
                                textCapitalization:
                                    TextCapitalization.characters,
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    '80l8tcli' /* Telefone */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                                keyboardType: TextInputType.phone,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model
                                    .textFieldTELETextControllerValidator
                                    .asValidator(context),
                                inputFormatters: [_model.textFieldTELEMask],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 5.0, 5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: FFLocalizations.of(context).getText(
                            'igui527f' /* Ocupação: */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 5.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).naveBar,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 5.0))
                        .addToEnd(const SizedBox(height: 5.0)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
                    child: FutureBuilder<List<AdminMembroRow>>(
                      future: AdminMembroTable().queryRows(
                        queryFn: (q) => q.order('id', ascending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).selectedNavBar,
                                ),
                              ),
                            ),
                          );
                        }
                        List<AdminMembroRow> dropDownWorkAdminMembroRowList =
                            snapshot.data!;

                        return FlutterFlowDropDown<String>(
                          controller: _model.dropDownWorkValueController ??=
                              FormFieldController<String>(
                            _model.dropDownWorkValue ??= '',
                          ),
                          options: List<String>.from(
                              dropDownWorkAdminMembroRowList
                                  .map((e) => e.adminMembroTeste)
                                  .withoutNulls
                                  .toList()),
                          optionLabels: dropDownWorkAdminMembroRowList
                              .map((e) => e.adminMembroTeste)
                              .withoutNulls
                              .toList(),
                          onChanged: (val) => safeSetState(
                              () => _model.dropDownWorkValue = val),
                          width: 200.0,
                          height: 40.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            '6hzebfto' /* Selecione */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).yellow,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 5.0, 5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: FFLocalizations.of(context).getText(
                            '88hd04ib' /* Status: */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 5.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).naveBar,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 5.0))
                        .addToEnd(const SizedBox(height: 5.0)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
                    child: FutureBuilder<List<StatusRow>>(
                      future: StatusTable().queryRows(
                        queryFn: (q) => q.order('id', ascending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).selectedNavBar,
                                ),
                              ),
                            ),
                          );
                        }
                        List<StatusRow> dropDownStatusStatusRowList =
                            snapshot.data!;

                        return FlutterFlowDropDown<String>(
                          controller: _model.dropDownStatusValueController ??=
                              FormFieldController<String>(
                            _model.dropDownStatusValue ??= '',
                          ),
                          options: List<String>.from(dropDownStatusStatusRowList
                              .map((e) => e.status)
                              .withoutNulls
                              .toList()),
                          optionLabels: dropDownStatusStatusRowList
                              .map((e) => e.status)
                              .withoutNulls
                              .toList(),
                          onChanged: (val) => safeSetState(
                              () => _model.dropDownStatusValue = val),
                          width: 200.0,
                          height: 40.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            '2atyokch' /* Selecione */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).yellow,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 5.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'hxu6cwj2' /* ID: */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).naveBar,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 5.0))
                        .addToEnd(const SizedBox(height: 5.0)),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          final datePickedDate = await showDatePicker(
                            context: context,
                            initialDate: getCurrentTimestamp,
                            firstDate: getCurrentTimestamp,
                            lastDate: DateTime(2050),
                            builder: (context, child) {
                              return wrapInMaterialDatePickerTheme(
                                context,
                                child!,
                                headerBackgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                headerForegroundColor:
                                    FlutterFlowTheme.of(context).info,
                                headerTextStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                pickerBackgroundColor:
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                pickerForegroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                selectedDateTimeBackgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                selectedDateTimeForegroundColor:
                                    FlutterFlowTheme.of(context).info,
                                actionButtonForegroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                iconSize: 24.0,
                              );
                            },
                          );

                          if (datePickedDate != null) {
                            safeSetState(() {
                              _model.datePicked = DateTime(
                                datePickedDate.year,
                                datePickedDate.month,
                                datePickedDate.day,
                              );
                            });
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 45.0,
                          constraints: const BoxConstraints(
                            maxHeight: 40.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).yellow,
                              width: 2.0,
                            ),
                          ),
                          child: SizedBox(
                            width: 200.0,
                            child: TextFormField(
                              controller: _model.textFieldIDTextController,
                              focusNode: _model.textFieldIDFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textFieldIDTextController',
                                const Duration(milliseconds: 2000),
                                () async {
                                  _model.iDExiste =
                                      await MembrosTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'IdMembro',
                                      int.tryParse(_model
                                          .textFieldIDTextController.text),
                                    ),
                                  );
                                  if (_model.iDExiste?.length == 1) {
                                    await Future.wait([
                                      Future(() async {
                                        safeSetState(() {
                                          _model.dropDownWorkValueController
                                                  ?.value =
                                              _model.iDExiste!.firstOrNull!
                                                  .adminMembro!;
                                        });
                                      }),
                                      Future(() async {
                                        // NOME
                                        safeSetState(() {
                                          _model.textFieldNOMETextController
                                                  ?.text =
                                              _model
                                                  .iDExiste!.firstOrNull!.nome!;
                                        });
                                      }),
                                      Future(() async {
                                        // EMAIL
                                        safeSetState(() {
                                          _model.textFieldEMAILTextController
                                                  ?.text =
                                              _model.iDExiste!.firstOrNull!
                                                  .email!;
                                        });
                                      }),
                                      Future(() async {
                                        safeSetState(() {
                                          _model.textController3?.text = _model
                                              .iDExiste!.firstOrNull!.cpf!;
                                          _model.textFieldMask.updateMask(
                                            newValue: TextEditingValue(
                                              text:
                                                  _model.textController3!.text,
                                            ),
                                          );
                                        });
                                      }),
                                      Future(() async {
                                        // TELE
                                        safeSetState(() {
                                          _model.textFieldTELETextController
                                                  ?.text =
                                              _model.iDExiste!.firstOrNull!
                                                  .telefone!;
                                          _model.textFieldTELEMask.updateMask(
                                            newValue: TextEditingValue(
                                              text: _model
                                                  .textFieldTELETextController!
                                                  .text,
                                            ),
                                          );
                                        });
                                      }),
                                      Future(() async {
                                        safeSetState(() {
                                          _model.dropDownStatusValueController
                                                  ?.value =
                                              _model.iDExiste!.firstOrNull!
                                                  .status!;
                                        });
                                      }),
                                    ]);
                                  } else {
                                    safeSetState(() {
                                      _model.textFieldIDTextController?.clear();
                                      _model.textFieldTELETextController
                                          ?.clear();
                                      _model.textFieldTELEMask.clear();
                                      _model.textFieldNOMETextController
                                          ?.clear();
                                      _model.textFieldEMAILTextController
                                          ?.clear();
                                      _model.textController3?.clear();
                                      _model.textFieldMask.clear();
                                    });
                                    safeSetState(() {
                                      _model.dropDownWorkValueController
                                          ?.reset();
                                    });
                                  }

                                  safeSetState(() {});
                                },
                              ),
                              autofocus: false,
                              textInputAction: TextInputAction.done,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'uoar2jmh' /* Id */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                suffixIcon: Icon(
                                  Icons.vpn_lock_sharp,
                                  color:
                                      FlutterFlowTheme.of(context).fundoLetra,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              keyboardType: TextInputType.number,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model
                                  .textFieldIDTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          // Tele
                          _model.membroTele = await MembrosTable().queryRows(
                            queryFn: (q) => q.eqOrNull(
                              'Telefone',
                              _model.textFieldTELETextController.text,
                            ),
                          );
                          if (_model.membroTele?.length == 1) {
                            await Future.wait([
                              Future(() async {
                                // ID
                                safeSetState(() {
                                  _model.textFieldIDTextController?.text =
                                      _model.membroTele!.firstOrNull!.idMembro
                                          .toString();
                                });
                              }),
                              Future(() async {
                                // NOME
                                safeSetState(() {
                                  _model.textFieldNOMETextController?.text =
                                      _model.membroTele!.firstOrNull!.nome!;
                                });
                              }),
                              Future(() async {
                                // EMAIL
                                safeSetState(() {
                                  _model.textFieldEMAILTextController?.text =
                                      _model.membroTele!.firstOrNull!.email!;
                                });
                              }),
                              Future(() async {
                                safeSetState(() {
                                  _model.textController3?.text =
                                      _model.membroTele!.firstOrNull!.cpf!;
                                  _model.textFieldMask.updateMask(
                                    newValue: TextEditingValue(
                                      text: _model.textController3!.text,
                                    ),
                                  );
                                });
                              }),
                              Future(() async {
                                // Work
                                safeSetState(() {
                                  _model.dropDownWorkValueController?.value =
                                      _model.membroTele!.firstOrNull!
                                          .adminMembro!;
                                });
                              }),
                              Future(() async {
                                safeSetState(() {
                                  _model.dropDownStatusValueController?.value =
                                      _model.membroTele!.firstOrNull!.status!;
                                });
                              }),
                            ]);
                          } else {
                            // CPf
                            _model.membroExiste2 =
                                await MembrosTable().queryRows(
                              queryFn: (q) => q.eqOrNull(
                                'Cpf',
                                _model.textController3.text,
                              ),
                            );
                            if (_model.membroExiste2?.length == 1) {
                              await Future.wait([
                                Future(() async {
                                  // ID
                                  safeSetState(() {
                                    _model.textFieldIDTextController?.text =
                                        _model.membroExiste2!.firstOrNull!
                                            .idMembro
                                            .toString();
                                  });
                                }),
                                Future(() async {
                                  // NOME
                                  safeSetState(() {
                                    _model.textFieldNOMETextController?.text =
                                        _model
                                            .membroExiste2!.firstOrNull!.nome!;
                                  });
                                }),
                                Future(() async {
                                  // EMAIL
                                  safeSetState(() {
                                    _model.textFieldEMAILTextController?.text =
                                        _model
                                            .membroExiste2!.firstOrNull!.email!;
                                  });
                                }),
                                Future(() async {
                                  // Work
                                  safeSetState(() {
                                    _model.dropDownWorkValueController?.value =
                                        _model.membroExiste2!.firstOrNull!
                                            .adminMembro!;
                                  });
                                }),
                                Future(() async {
                                  safeSetState(() {
                                    _model.textFieldTELETextController?.text =
                                        _model.membroExiste2!.firstOrNull!
                                            .telefone!;
                                    _model.textFieldTELEMask.updateMask(
                                      newValue: TextEditingValue(
                                        text: _model
                                            .textFieldTELETextController!.text,
                                      ),
                                    );
                                  });
                                }),
                                Future(() async {
                                  safeSetState(() {
                                    _model.dropDownStatusValueController
                                            ?.value =
                                        _model.membroExiste2!.firstOrNull!
                                            .status!;
                                  });
                                }),
                              ]);
                            } else {
                              // 3
                              _model.membroExiste3 =
                                  await MembrosTable().queryRows(
                                queryFn: (q) => q.eqOrNull(
                                  'Email',
                                  _model.textFieldEMAILTextController.text,
                                ),
                              );
                              if (_model.membroExiste3?.length == 1) {
                                await Future.wait([
                                  Future(() async {
                                    // ID
                                    safeSetState(() {
                                      _model.textFieldIDTextController?.text =
                                          _model.membroExiste3!.firstOrNull!
                                              .idMembro
                                              .toString();
                                    });
                                  }),
                                  Future(() async {
                                    // NOME
                                    safeSetState(() {
                                      _model.textFieldNOMETextController?.text =
                                          _model.membroExiste3!.firstOrNull!
                                              .nome!;
                                    });
                                  }),
                                  Future(() async {
                                    safeSetState(() {
                                      _model.textController3?.text = _model
                                          .membroExiste3!.firstOrNull!.cpf!;
                                      _model.textFieldMask.updateMask(
                                        newValue: TextEditingValue(
                                          text: _model.textController3!.text,
                                        ),
                                      );
                                    });
                                  }),
                                  Future(() async {
                                    // Work
                                    safeSetState(() {
                                      _model.dropDownWorkValueController
                                              ?.value =
                                          _model.membroExiste3!.firstOrNull!
                                              .adminMembro!;
                                    });
                                  }),
                                  Future(() async {
                                    safeSetState(() {
                                      _model.textFieldTELETextController?.text =
                                          _model.membroExiste3!.firstOrNull!
                                              .telefone!;
                                      _model.textFieldTELEMask.updateMask(
                                        newValue: TextEditingValue(
                                          text: _model
                                              .textFieldTELETextController!
                                              .text,
                                        ),
                                      );
                                    });
                                  }),
                                  Future(() async {
                                    safeSetState(() {
                                      _model.dropDownStatusValueController
                                              ?.value =
                                          _model.membroExiste3!.firstOrNull!
                                              .status!;
                                    });
                                  }),
                                ]);
                              } else {
                                // NOME
                                _model.membroExiste4 =
                                    await MembrosTable().queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'Nome',
                                    _model.textFieldNOMETextController.text,
                                  ),
                                );
                                if (_model.membroExiste4?.length == 1) {
                                  await Future.wait([
                                    Future(() async {
                                      // ID
                                      safeSetState(() {
                                        _model.textFieldIDTextController?.text =
                                            _model.membroExiste4!.firstOrNull!
                                                .idMembro
                                                .toString();
                                      });
                                    }),
                                    Future(() async {
                                      // Work
                                      safeSetState(() {
                                        _model.dropDownWorkValueController
                                                ?.value =
                                            _model.membroExiste4!.firstOrNull!
                                                .adminMembro!;
                                      });
                                    }),
                                    Future(() async {
                                      // EMAIL
                                      safeSetState(() {
                                        _model.textFieldEMAILTextController
                                                ?.text =
                                            _model.membroExiste4!.firstOrNull!
                                                .email!;
                                      });
                                    }),
                                    Future(() async {
                                      safeSetState(() {
                                        _model.textController3?.text = _model
                                            .membroExiste4!.firstOrNull!.cpf!;
                                        _model.textFieldMask.updateMask(
                                          newValue: TextEditingValue(
                                            text: _model.textController3!.text,
                                          ),
                                        );
                                      });
                                    }),
                                    Future(() async {
                                      safeSetState(() {
                                        _model.textFieldTELETextController
                                                ?.text =
                                            _model.membroExiste4!.firstOrNull!
                                                .telefone!;
                                        _model.textFieldTELEMask.updateMask(
                                          newValue: TextEditingValue(
                                            text: _model
                                                .textFieldTELETextController!
                                                .text,
                                          ),
                                        );
                                      });
                                    }),
                                    Future(() async {
                                      safeSetState(() {
                                        _model.dropDownStatusValueController
                                                ?.value =
                                            _model.membroExiste4!.firstOrNull!
                                                .status!;
                                      });
                                    }),
                                  ]);
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Alerta'),
                                        content: const Text(
                                            'Membro não encontrado... Verifique se os campos estão preenchidos corretamente'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  FFAppState().deleteCPFAppS();
                                  FFAppState().CPFAppS = '';

                                  safeSetState(() {});
                                }
                              }
                            }
                          }

                          safeSetState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'hq890ulz' /* Buscar */,
                        ),
                        icon: const FaIcon(
                          FontAwesomeIcons.search,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFFFF6B29),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if ((_model.textFieldNOMETextController
                                                  .text ==
                                              '') ||
                                      (_model.textFieldEMAILTextController
                                                  .text ==
                                              '') ||
                                      (_model.textController3.text == '') ||
                                      (_model.textFieldTELETextController
                                                  .text ==
                                              '') ||
                                      (_model.dropDownWorkValue == null ||
                                          _model.dropDownWorkValue == '')) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Erro'),
                                          content: const Text('Campos Vazios'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    _model.editarID =
                                        await MembrosTable().queryRows(
                                      queryFn: (q) => q.eqOrNull(
                                        'IdMembro',
                                        int.tryParse(_model
                                            .textFieldIDTextController.text),
                                      ),
                                    );
                                    if (_model.editarID?.length == 1) {
                                      _model.idGuia =
                                          await AdminMembroTable().queryRows(
                                        queryFn: (q) => q.eqOrNull(
                                          'adminMembroTeste',
                                          _model.dropDownWorkValue,
                                        ),
                                      );
                                      if (_model.idGuia?.length == 1) {
                                        await MembrosTable().update(
                                          data: {
                                            'Nome': _model
                                                .textFieldNOMETextController
                                                .text,
                                            'AdminMembro':
                                                _model.dropDownWorkValue,
                                            'Email': _model
                                                .textFieldEMAILTextController
                                                .text,
                                            'Cpf': _model.textController3.text,
                                            'Telefone': _model
                                                .textFieldTELETextController
                                                .text,
                                            'Status':
                                                _model.dropDownStatusValue,
                                            'Id_AdmMemb_GuiaFF':
                                                _model.idGuia?.firstOrNull?.id,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'IdMembro',
                                            _model.editarID?.firstOrNull
                                                ?.idMembro,
                                          ),
                                        );
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: const Text('Sucesso'),
                                              content: const Text(
                                                  'Membro editado com sucesso!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    }
                                  }

                                  safeSetState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'gh3b4en9' /* Editar */,
                                ),
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 5.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).yellow,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: FFButtonWidget(
                              onPressed: () async {
                                safeSetState(() {
                                  _model.textFieldIDTextController?.clear();
                                  _model.textFieldNOMETextController?.clear();
                                  _model.textFieldEMAILTextController?.clear();
                                  _model.textFieldTELETextController?.clear();
                                  _model.textFieldTELEMask.clear();
                                  _model.textController3?.clear();
                                  _model.textFieldMask.clear();
                                });
                                safeSetState(() {
                                  _model.dropDownWorkValueController?.reset();
                                });
                              },
                              text: FFLocalizations.of(context).getText(
                                '1rqpmfjd' /* Limpar */,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).fundoEDIT,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                  shadows: [
                                    Shadow(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      offset: const Offset(2.0, 2.0),
                                      blurRadius: 2.0,
                                    )
                                  ],
                                ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 4.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
