import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'contrde_ingre_a_d_m_funcional_model.dart';
export 'contrde_ingre_a_d_m_funcional_model.dart';

class ContrdeIngreADMFuncionalWidget extends StatefulWidget {
  const ContrdeIngreADMFuncionalWidget({super.key});

  @override
  State<ContrdeIngreADMFuncionalWidget> createState() =>
      _ContrdeIngreADMFuncionalWidgetState();
}

class _ContrdeIngreADMFuncionalWidgetState
    extends State<ContrdeIngreADMFuncionalWidget> {
  late ContrdeIngreADMFuncionalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContrdeIngreADMFuncionalModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
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
                context.safePop();
              },
            ),
            title: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'gxl1yiql' /* Controle de Ingressos */,
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
                      'wiw5q2yy' /* ------------------------------... */,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 10.0),
                  child: FutureBuilder<List<ResultadoRow>>(
                    future: ResultadoTable().queryRows(
                      queryFn: (q) => q.order('IdEvento'),
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
                      List<ResultadoRow> listViewResultadoRowList =
                          snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewResultadoRowList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewResultadoRow =
                              listViewResultadoRowList[listViewIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 10.0, 16.0, 8.0),
                            child: FutureBuilder<List<EventosRow>>(
                              future: EventosTable().queryRows(
                                queryFn: (q) => q.eqOrNull(
                                  'idEvento',
                                  listViewResultadoRow.idEvento,
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

                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: cardViewEventosRowList
                                                .firstOrNull?.status ==
                                            true
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        4.0, 4.0, 4.0, 8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 0.0, 0.0),
                                          child:
                                              FutureBuilder<List<EventosRow>>(
                                            future: EventosTable().queryRows(
                                              queryFn: (q) => q.eqOrNull(
                                                'idEvento',
                                                listViewResultadoRow.idEvento,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .selectedNavBar,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<EventosRow>
                                                  textEventosRowList =
                                                  snapshot.data!;

                                              return Text(
                                                valueOrDefault<String>(
                                                  textEventosRowList
                                                      .firstOrNull?.nomeEvento,
                                                  'null',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      color: cardViewEventosRowList
                                                                  .firstOrNull
                                                                  ?.status ==
                                                              true
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .info
                                                          : const Color(0xFFB4B4B4),
                                                      fontSize: 22.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 10.0, 5.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: cardViewEventosRowList
                                                          .firstOrNull
                                                          ?.status ==
                                                      true
                                                  ? Colors.white
                                                  : const Color(0xFFB4B4B4),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: cardViewEventosRowList
                                                            .firstOrNull
                                                            ?.status ==
                                                        true
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .customColor1
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .eventoDesativado,
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
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'bemx2wsm' /* Ingressos Vendidos: */,
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
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                      FutureBuilder<
                                                          List<
                                                              QuantidadeVendasTotalRow>>(
                                                        future:
                                                            QuantidadeVendasTotalTable()
                                                                .querySingleRow(
                                                          queryFn: (q) =>
                                                              q.eqOrNull(
                                                            'IdEvento',
                                                            listViewResultadoRow
                                                                .idEvento,
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .selectedNavBar,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<QuantidadeVendasTotalRow>
                                                              textQuantidadeVendasTotalRowList =
                                                              snapshot.data!;

                                                          final textQuantidadeVendasTotalRow =
                                                              textQuantidadeVendasTotalRowList
                                                                      .isNotEmpty
                                                                  ? textQuantidadeVendasTotalRowList
                                                                      .first
                                                                  : null;

                                                          return AutoSizeText(
                                                            valueOrDefault<
                                                                String>(
                                                              textQuantidadeVendasTotalRow
                                                                  ?.totalVendido
                                                                  ?.toString(),
                                                              'null',
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
                                                    ].divide(
                                                        const SizedBox(width: 2.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'uujo15hp' /* Valor Total: */,
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
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                      AutoSizeText(
                                                        valueOrDefault<String>(
                                                          listViewResultadoRow
                                                              .totalvalor
                                                              ?.toString(),
                                                          'null',
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
                                                              color: const Color(
                                                                  0xFF15161E),
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'cy4g8l3l' /* Valor do Ingresso: */,
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
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                      FutureBuilder<
                                                          List<IngressosRow>>(
                                                        future: IngressosTable()
                                                            .querySingleRow(
                                                          queryFn: (q) =>
                                                              q.eqOrNull(
                                                            'IdEvento',
                                                            listViewResultadoRow
                                                                .idEvento,
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .selectedNavBar,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<IngressosRow>
                                                              textIngressosRowList =
                                                              snapshot.data!;

                                                          final textIngressosRow =
                                                              textIngressosRowList
                                                                      .isNotEmpty
                                                                  ? textIngressosRowList
                                                                      .first
                                                                  : null;

                                                          return AutoSizeText(
                                                            valueOrDefault<
                                                                String>(
                                                              textIngressosRow
                                                                  ?.valorIngresso
                                                                  ?.toString(),
                                                              'null',
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
                                                    ].divide(
                                                        const SizedBox(width: 2.0)),
                                                  ),
                                                ].divide(const SizedBox(height: 1.0)),
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
