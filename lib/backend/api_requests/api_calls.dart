import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GerarPdfCall {
  static Future<ApiCallResponse> call({
    String? titulo = '',
    String? local = '',
    String? data = '',
    String? hora = '',
    String? descricao = '',
    String? templateId = '',
    String? xApiKey = '',
  }) async {
    final ffApiRequestBody = '''
{
"data": {
    "invoice_number": "INV38379",
    "date": "2021-09-30",
    "currency": "USD",
    "total_amount": 82542.56,
    "titulo": "$titulo",
    "local": "$local",
    "data": "$data",
    "hora": "$hora",
    "descricao":"$descricao"
  },
 "Load_data_from": null,
  "template_id": "$templateId",
  "version": 8,
  "export_type": "json",
  "expiration": 60,
  "output_file": "output.pdf",
  "is_cmyk": false,
  "image_resample_res": 600,
  "direct_download": 0,
  "cloud_storage": 1,
  "pdf_standard": "string"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GerarPdf',
      apiUrl: 'https://api.craftmypdf.com/v1/create',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-API-KEY': '1fd4MTUxMDA6MTUxNzE6cnR3eGs3aHNEZjF3dHR4ZA=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? file(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.file''',
      ));
  static String? transactionRef(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.transaction_ref''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static int? totalPages(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total_pages''',
      ));
  static int? fileSize(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.file_size''',
      ));
  static String? templateId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.template_id''',
      ));
}

class BuscarCepCall {
  static Future<ApiCallResponse> call({
    String? cep = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'BuscarCep',
      apiUrl: 'https://viacep.com.br/ws/$cep/json/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? cep(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.cep''',
      ));
  static String? logradouro(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.logradouro''',
      ));
  static String? bairro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.bairro''',
      ));
  static String? localidade(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.localidade''',
      ));
  static String? uf(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.uf''',
      ));
  static String? estado(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.estado''',
      ));
  static String? regiao(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.regiao''',
      ));
  static String? ibge(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ibge''',
      ));
  static String? gia(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.gia''',
      ));
  static String? ddd(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ddd''',
      ));
  static String? siafi(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.siafi''',
      ));
}

class PegarPDFCall {
  static Future<ApiCallResponse> call({
    String? titulo = '',
    String? local = '',
    String? data = '',
    String? hora = '',
    String? descricao = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'PegarPDF',
      apiUrl:
          'https://api.craftmypdf.com/v1/get-template?template_id=89577b23b7869744',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'X-API-KEY': '1fd4MTUxMDA6MTUxNzE6cnR3eGs3aHNEZjF3dHR4ZA=',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? templateId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.template_id''',
      ));
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  static String? body(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.body''',
      ));
  static String? json(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.json''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
