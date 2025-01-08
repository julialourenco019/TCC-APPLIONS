import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/sara_edit/editar_ingresso/editar_ingresso_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'usu_meus_ingressos_model.dart';
export 'usu_meus_ingressos_model.dart';

class UsuMeusIngressosWidget extends StatefulWidget {
  const UsuMeusIngressosWidget({
    super.key,
    required this.idEvento,
  });

  final int? idEvento;

  @override
  State<UsuMeusIngressosWidget> createState() => _UsuMeusIngressosWidgetState();
}

class _UsuMeusIngressosWidgetState extends State<UsuMeusIngressosWidget> {
  late UsuMeusIngressosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsuMeusIngressosModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () async {
                _model.membroId = await MembrosTable().queryRows(
                  queryFn: (q) => q.eqOrNull(
                    'IdMembro',
                    FFAppState().MenbroId,
                  ),
                );
                if (_model.membroId?.length == 1) {
                  if (_model.membroId?.firstOrNull?.adminMembro == 'Membro'
                      ? true
                      : false) {
                    context.pushNamed('events');
                  } else {
                    context.pushNamed('eventesADM');
                  }
                }

                safeSetState(() {});
              },
            ),
            title: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'vp7jd8yq' /* Meus Ingressos */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'knq6xdao' /* ------------------------------ */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).yellow,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
            actions: const [],
            centerTitle: true,
            toolbarHeight: 100.0,
            elevation: 1.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(1.0, 1.0, 1.0, 1.0),
                  child: FutureBuilder<List<IngressosRow>>(
                    future: IngressosTable().queryRows(
                      queryFn: (q) => q
                          .eqOrNull(
                            'IdMembro',
                            FFAppState().MenbroId,
                          )
                          .order('IdIngresso'),
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
                      List<IngressosRow> listViewIngressosRowList =
                          snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewIngressosRowList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewIngressosRow =
                              listViewIngressosRowList[listViewIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 10.0, 16.0, 8.0),
                            child: FutureBuilder<List<EventosRow>>(
                              future: EventosTable().querySingleRow(
                                queryFn: (q) => q.eqOrNull(
                                  'idEvento',
                                  listViewIngressosRow.idEvento,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context)
                                              .selectedNavBar,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<EventosRow> cardViewEventosRowList =
                                    snapshot.data!;

                                final cardViewEventosRow =
                                    cardViewEventosRowList.isNotEmpty
                                        ? cardViewEventosRowList.first
                                        : null;

                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: listViewIngressosRow.status == true
                                        ? FlutterFlowTheme.of(context).teams
                                        : FlutterFlowTheme.of(context)
                                            .eventoDesativado,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 3.0,
                                        color: Color(0x411D2429),
                                        offset: Offset(
                                          0.0,
                                          1.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              cardViewEventosRow?.nomeEvento,
                                              'null',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  fontSize: 22.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 10.0, 5.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  listViewIngressosRow.status ==
                                                          true
                                                      ? Colors.white
                                                      : const Color(0xFFB4B4B4),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: valueOrDefault<Color>(
                                                  listViewIngressosRow.status ==
                                                          true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .customColor1
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .customColor4,
                                                  FlutterFlowTheme.of(context)
                                                      .customColor1,
                                                ),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '0r9d8v60' /* Ingressos vendidos: */,
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: const Color(
                                                                      0xFF15161E),
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          FutureBuilder<
                                                              List<
                                                                  IngressosRow>>(
                                                            future: IngressosTable()
                                                                .querySingleRow(
                                                              queryFn: (q) => q,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .selectedNavBar,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<IngressosRow>
                                                                  textIngressosRowList =
                                                                  snapshot
                                                                      .data!;

                                                              final textIngressosRow =
                                                                  textIngressosRowList
                                                                          .isNotEmpty
                                                                      ? textIngressosRowList
                                                                          .first
                                                                      : null;

                                                              return AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  listViewIngressosRow
                                                                      .quantidadeVenda
                                                                      ?.toString(),
                                                                  'null',
                                                                ).maybeHandleOverflow(
                                                                  maxChars: 70,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Plus Jakarta Sans',
                                                                      color: const Color(
                                                                          0xFF15161E),
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                    ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 2.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          AutoSizeText(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '2tavdhq1' /* Valor ao todo: */,
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    listViewIngressosRow.status ==
                                                                            true
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .customColor1
                                                                        : FlutterFlowTheme.of(context)
                                                                            .customColor4,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor1,
                                                                  ),
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                ),
                                                          ),
                                                          AutoSizeText(
                                                            valueOrDefault<
                                                                String>(
                                                              formatNumber(
                                                                listViewIngressosRow
                                                                    .valorTotal,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                currency: 'R\$',
                                                                format:
                                                                    '#,##0.00',
                                                                locale: 'pt_BR',
                                                              ),
                                                              'valorTotal',
                                                            ).maybeHandleOverflow(
                                                              maxChars: 70,
                                                              replacement: '…',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    listViewIngressosRow.status ==
                                                                            true
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .customColor1
                                                                        : FlutterFlowTheme.of(context)
                                                                            .customColor4,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor1,
                                                                  ),
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 2.0)),
                                                  ),
                                                ].divide(const SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          const AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: SizedBox(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.35,
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.8,
                                                          child:
                                                              EditarIngressoWidget(
                                                            idIngresso:
                                                                listViewIngressosRow
                                                                    .idIngresso,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                4.0, 8.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'b6hf2pja' /* Editar... */,
                                                      ),
                                                      textAlign: TextAlign.end,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleLarge
                                                          .override(
                                                            fontFamily:
                                                                'Urbanist',
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              listViewIngressosRow
                                                                          .status ==
                                                                      true
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .warning
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .selectedNavBar,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .warning,
                                                            ),
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right_rounded,
                                                    color:
                                                        valueOrDefault<Color>(
                                                      listViewIngressosRow
                                                                  .status ==
                                                              true
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .warning
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .selectedNavBar,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .warning,
                                                    ),
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
