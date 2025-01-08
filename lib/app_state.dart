import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _Token = await secureStorage.getString('ff_Token') ?? _Token;
    });
    await _safeInitAsync(() async {
      _nome = await secureStorage.getString('ff_nome') ?? _nome;
    });
    await _safeInitAsync(() async {
      _MenbroId = await secureStorage.getInt('ff_MenbroId') ?? _MenbroId;
    });
    await _safeInitAsync(() async {
      _PaginaADM = await secureStorage.getBool('ff_PaginaADM') ?? _PaginaADM;
    });
    await _safeInitAsync(() async {
      _IdReuniaoAta =
          await secureStorage.getInt('ff_IdReuniaoAta') ?? _IdReuniaoAta;
    });
    await _safeInitAsync(() async {
      _quantidadeIngresso =
          await secureStorage.getInt('ff_quantidadeIngresso') ??
              _quantidadeIngresso;
    });
    await _safeInitAsync(() async {
      _resultadoIngresso = await secureStorage.getInt('ff_resultadoIngresso') ??
          _resultadoIngresso;
    });
    await _safeInitAsync(() async {
      _valorIngresso =
          await secureStorage.getInt('ff_valorIngresso') ?? _valorIngresso;
    });
    await _safeInitAsync(() async {
      _image = await secureStorage.getString('ff_image') ?? _image;
    });
    await _safeInitAsync(() async {
      _pdfFile = await secureStorage.getString('ff_pdfFile') ?? _pdfFile;
    });
    await _safeInitAsync(() async {
      _IdEventos = (await secureStorage.getStringList('ff_IdEventos'))
              ?.map(int.parse)
              .toList() ??
          _IdEventos;
    });
    await _safeInitAsync(() async {
      _IdEvent = await secureStorage.getInt('ff_IdEvent') ?? _IdEvent;
    });
    await _safeInitAsync(() async {
      _DataVendaAppS = await secureStorage.read(key: 'ff_DataVendaAppS') != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (await secureStorage.getInt('ff_DataVendaAppS'))!)
          : _DataVendaAppS;
    });
    await _safeInitAsync(() async {
      _CPFAppS = await secureStorage.getString('ff_CPFAppS') ?? _CPFAppS;
    });
    await _safeInitAsync(() async {
      _TeleAppS = await secureStorage.getString('ff_TeleAppS') ?? _TeleAppS;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _ttamount = '';
  String get ttamount => _ttamount;
  set ttamount(String value) {
    _ttamount = value;
  }

  double _tamount = 0.0;
  double get tamount => _tamount;
  set tamount(double value) {
    _tamount = value;
  }

  double _amount = 0.0;
  double get amount => _amount;
  set amount(double value) {
    _amount = value;
  }

  String _Token = '';
  String get Token => _Token;
  set Token(String value) {
    _Token = value;
    secureStorage.setString('ff_Token', value);
  }

  void deleteToken() {
    secureStorage.delete(key: 'ff_Token');
  }

  String _nome = '';
  String get nome => _nome;
  set nome(String value) {
    _nome = value;
    secureStorage.setString('ff_nome', value);
  }

  void deleteNome() {
    secureStorage.delete(key: 'ff_nome');
  }

  int _MenbroId = 0;
  int get MenbroId => _MenbroId;
  set MenbroId(int value) {
    _MenbroId = value;
    secureStorage.setInt('ff_MenbroId', value);
  }

  void deleteMenbroId() {
    secureStorage.delete(key: 'ff_MenbroId');
  }

  bool _PaginaADM = false;
  bool get PaginaADM => _PaginaADM;
  set PaginaADM(bool value) {
    _PaginaADM = value;
    secureStorage.setBool('ff_PaginaADM', value);
  }

  void deletePaginaADM() {
    secureStorage.delete(key: 'ff_PaginaADM');
  }

  int _IdReuniaoAta = 0;
  int get IdReuniaoAta => _IdReuniaoAta;
  set IdReuniaoAta(int value) {
    _IdReuniaoAta = value;
    secureStorage.setInt('ff_IdReuniaoAta', value);
  }

  void deleteIdReuniaoAta() {
    secureStorage.delete(key: 'ff_IdReuniaoAta');
  }

  int _quantidadeIngresso = 0;
  int get quantidadeIngresso => _quantidadeIngresso;
  set quantidadeIngresso(int value) {
    _quantidadeIngresso = value;
    secureStorage.setInt('ff_quantidadeIngresso', value);
  }

  void deleteQuantidadeIngresso() {
    secureStorage.delete(key: 'ff_quantidadeIngresso');
  }

  int _resultadoIngresso = 0;
  int get resultadoIngresso => _resultadoIngresso;
  set resultadoIngresso(int value) {
    _resultadoIngresso = value;
    secureStorage.setInt('ff_resultadoIngresso', value);
  }

  void deleteResultadoIngresso() {
    secureStorage.delete(key: 'ff_resultadoIngresso');
  }

  int _valorIngresso = 0;
  int get valorIngresso => _valorIngresso;
  set valorIngresso(int value) {
    _valorIngresso = value;
    secureStorage.setInt('ff_valorIngresso', value);
  }

  void deleteValorIngresso() {
    secureStorage.delete(key: 'ff_valorIngresso');
  }

  String _image =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/79qvizRJNqjCzlGk8uVK/assets/pmved6d137pd/lionlogo_2c_(1).jpg';
  String get image => _image;
  set image(String value) {
    _image = value;
    secureStorage.setString('ff_image', value);
  }

  void deleteImage() {
    secureStorage.delete(key: 'ff_image');
  }

  int _IDMembroEDITAR = 0;
  int get IDMembroEDITAR => _IDMembroEDITAR;
  set IDMembroEDITAR(int value) {
    _IDMembroEDITAR = value;
  }

  String _uploadAta = '';
  String get uploadAta => _uploadAta;
  set uploadAta(String value) {
    _uploadAta = value;
  }

  int _idAta2 = 0;
  int get idAta2 => _idAta2;
  set idAta2(int value) {
    _idAta2 = value;
  }

  String _pdfFile = '';
  String get pdfFile => _pdfFile;
  set pdfFile(String value) {
    _pdfFile = value;
    secureStorage.setString('ff_pdfFile', value);
  }

  void deletePdfFile() {
    secureStorage.delete(key: 'ff_pdfFile');
  }

  double _VendasFeitas = 0.0;
  double get VendasFeitas => _VendasFeitas;
  set VendasFeitas(double value) {
    _VendasFeitas = value;
  }

  List<int> _IdEventos = [];
  List<int> get IdEventos => _IdEventos;
  set IdEventos(List<int> value) {
    _IdEventos = value;
    secureStorage.setStringList(
        'ff_IdEventos', value.map((x) => x.toString()).toList());
  }

  void deleteIdEventos() {
    secureStorage.delete(key: 'ff_IdEventos');
  }

  void addToIdEventos(int value) {
    IdEventos.add(value);
    secureStorage.setStringList(
        'ff_IdEventos', _IdEventos.map((x) => x.toString()).toList());
  }

  void removeFromIdEventos(int value) {
    IdEventos.remove(value);
    secureStorage.setStringList(
        'ff_IdEventos', _IdEventos.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromIdEventos(int index) {
    IdEventos.removeAt(index);
    secureStorage.setStringList(
        'ff_IdEventos', _IdEventos.map((x) => x.toString()).toList());
  }

  void updateIdEventosAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    IdEventos[index] = updateFn(_IdEventos[index]);
    secureStorage.setStringList(
        'ff_IdEventos', _IdEventos.map((x) => x.toString()).toList());
  }

  void insertAtIndexInIdEventos(int index, int value) {
    IdEventos.insert(index, value);
    secureStorage.setStringList(
        'ff_IdEventos', _IdEventos.map((x) => x.toString()).toList());
  }

  int _IdEvent = 0;
  int get IdEvent => _IdEvent;
  set IdEvent(int value) {
    _IdEvent = value;
    secureStorage.setInt('ff_IdEvent', value);
  }

  void deleteIdEvent() {
    secureStorage.delete(key: 'ff_IdEvent');
  }

  DateTime? _dataEvento = DateTime.fromMillisecondsSinceEpoch(1732999140000);
  DateTime? get dataEvento => _dataEvento;
  set dataEvento(DateTime? value) {
    _dataEvento = value;
  }

  DateTime? _HrEvento = DateTime.fromMillisecondsSinceEpoch(1731447780000);
  DateTime? get HrEvento => _HrEvento;
  set HrEvento(DateTime? value) {
    _HrEvento = value;
  }

  String _HREventoString = '';
  String get HREventoString => _HREventoString;
  set HREventoString(String value) {
    _HREventoString = value;
  }

  DateTime? _DataVendaAppS = DateTime.fromMillisecondsSinceEpoch(1732999140000);
  DateTime? get DataVendaAppS => _DataVendaAppS;
  set DataVendaAppS(DateTime? value) {
    _DataVendaAppS = value;
    value != null
        ? secureStorage.setInt('ff_DataVendaAppS', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_DataVendaAppS');
  }

  void deleteDataVendaAppS() {
    secureStorage.delete(key: 'ff_DataVendaAppS');
  }

  IngressosVendaStruct _InformVendas = IngressosVendaStruct();
  IngressosVendaStruct get InformVendas => _InformVendas;
  set InformVendas(IngressosVendaStruct value) {
    _InformVendas = value;
  }

  void updateInformVendasStruct(Function(IngressosVendaStruct) updateFn) {
    updateFn(_InformVendas);
  }

  int _QuantiaDeVezes = 0;
  int get QuantiaDeVezes => _QuantiaDeVezes;
  set QuantiaDeVezes(int value) {
    _QuantiaDeVezes = value;
  }

  String _CPFAppS = '';
  String get CPFAppS => _CPFAppS;
  set CPFAppS(String value) {
    _CPFAppS = value;
    secureStorage.setString('ff_CPFAppS', value);
  }

  void deleteCPFAppS() {
    secureStorage.delete(key: 'ff_CPFAppS');
  }

  String _TeleAppS = '';
  String get TeleAppS => _TeleAppS;
  set TeleAppS(String value) {
    _TeleAppS = value;
    secureStorage.setString('ff_TeleAppS', value);
  }

  void deleteTeleAppS() {
    secureStorage.delete(key: 'ff_TeleAppS');
  }

  String _bbamount = 'CPF';
  String get bbamount => _bbamount;
  set bbamount(String value) {
    _bbamount = value;
  }

  String _bamount = '';
  String get bamount => _bamount;
  set bamount(String value) {
    _bamount = value;
  }

  String _dataAta = '';
  String get dataAta => _dataAta;
  set dataAta(String value) {
    _dataAta = value;
  }

  String _dataString = '';
  String get dataString => _dataString;
  set dataString(String value) {
    _dataString = value;
  }

  bool _EventoStatus = false;
  bool get EventoStatus => _EventoStatus;
  set EventoStatus(bool value) {
    _EventoStatus = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
