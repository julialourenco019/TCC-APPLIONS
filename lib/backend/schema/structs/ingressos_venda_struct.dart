// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IngressosVendaStruct extends BaseStruct {
  IngressosVendaStruct({
    int? quantasVezezVendida,
    int? quantiaDeIngressos,
    int? iDdoEVENTO,
    int? iDusuario,
  })  : _quantasVezezVendida = quantasVezezVendida,
        _quantiaDeIngressos = quantiaDeIngressos,
        _iDdoEVENTO = iDdoEVENTO,
        _iDusuario = iDusuario;

  // "QuantasVezezVendida" field.
  int? _quantasVezezVendida;
  int get quantasVezezVendida => _quantasVezezVendida ?? 0;
  set quantasVezezVendida(int? val) => _quantasVezezVendida = val;

  void incrementQuantasVezezVendida(int amount) =>
      quantasVezezVendida = quantasVezezVendida + amount;

  bool hasQuantasVezezVendida() => _quantasVezezVendida != null;

  // "QuantiaDeIngressos" field.
  int? _quantiaDeIngressos;
  int get quantiaDeIngressos => _quantiaDeIngressos ?? 0;
  set quantiaDeIngressos(int? val) => _quantiaDeIngressos = val;

  void incrementQuantiaDeIngressos(int amount) =>
      quantiaDeIngressos = quantiaDeIngressos + amount;

  bool hasQuantiaDeIngressos() => _quantiaDeIngressos != null;

  // "IDdoEVENTO" field.
  int? _iDdoEVENTO;
  int get iDdoEVENTO => _iDdoEVENTO ?? 0;
  set iDdoEVENTO(int? val) => _iDdoEVENTO = val;

  void incrementIDdoEVENTO(int amount) => iDdoEVENTO = iDdoEVENTO + amount;

  bool hasIDdoEVENTO() => _iDdoEVENTO != null;

  // "IDusuario" field.
  int? _iDusuario;
  int get iDusuario => _iDusuario ?? 0;
  set iDusuario(int? val) => _iDusuario = val;

  void incrementIDusuario(int amount) => iDusuario = iDusuario + amount;

  bool hasIDusuario() => _iDusuario != null;

  static IngressosVendaStruct fromMap(Map<String, dynamic> data) =>
      IngressosVendaStruct(
        quantasVezezVendida: castToType<int>(data['QuantasVezezVendida']),
        quantiaDeIngressos: castToType<int>(data['QuantiaDeIngressos']),
        iDdoEVENTO: castToType<int>(data['IDdoEVENTO']),
        iDusuario: castToType<int>(data['IDusuario']),
      );

  static IngressosVendaStruct? maybeFromMap(dynamic data) => data is Map
      ? IngressosVendaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'QuantasVezezVendida': _quantasVezezVendida,
        'QuantiaDeIngressos': _quantiaDeIngressos,
        'IDdoEVENTO': _iDdoEVENTO,
        'IDusuario': _iDusuario,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'QuantasVezezVendida': serializeParam(
          _quantasVezezVendida,
          ParamType.int,
        ),
        'QuantiaDeIngressos': serializeParam(
          _quantiaDeIngressos,
          ParamType.int,
        ),
        'IDdoEVENTO': serializeParam(
          _iDdoEVENTO,
          ParamType.int,
        ),
        'IDusuario': serializeParam(
          _iDusuario,
          ParamType.int,
        ),
      }.withoutNulls;

  static IngressosVendaStruct fromSerializableMap(Map<String, dynamic> data) =>
      IngressosVendaStruct(
        quantasVezezVendida: deserializeParam(
          data['QuantasVezezVendida'],
          ParamType.int,
          false,
        ),
        quantiaDeIngressos: deserializeParam(
          data['QuantiaDeIngressos'],
          ParamType.int,
          false,
        ),
        iDdoEVENTO: deserializeParam(
          data['IDdoEVENTO'],
          ParamType.int,
          false,
        ),
        iDusuario: deserializeParam(
          data['IDusuario'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'IngressosVendaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IngressosVendaStruct &&
        quantasVezezVendida == other.quantasVezezVendida &&
        quantiaDeIngressos == other.quantiaDeIngressos &&
        iDdoEVENTO == other.iDdoEVENTO &&
        iDusuario == other.iDusuario;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([quantasVezezVendida, quantiaDeIngressos, iDdoEVENTO, iDusuario]);
}

IngressosVendaStruct createIngressosVendaStruct({
  int? quantasVezezVendida,
  int? quantiaDeIngressos,
  int? iDdoEVENTO,
  int? iDusuario,
}) =>
    IngressosVendaStruct(
      quantasVezezVendida: quantasVezezVendida,
      quantiaDeIngressos: quantiaDeIngressos,
      iDdoEVENTO: iDdoEVENTO,
      iDusuario: iDusuario,
    );
