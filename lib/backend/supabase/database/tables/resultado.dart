import '../database.dart';

class ResultadoTable extends SupabaseTable<ResultadoRow> {
  @override
  String get tableName => 'resultado';

  @override
  ResultadoRow createRow(Map<String, dynamic> data) => ResultadoRow(data);
}

class ResultadoRow extends SupabaseDataRow {
  ResultadoRow(super.data);

  @override
  SupabaseTable get table => ResultadoTable();

  int? get idEvento => getField<int>('IdEvento');
  set idEvento(int? value) => setField<int>('IdEvento', value);

  double? get totalvalor => getField<double>('totalvalor');
  set totalvalor(double? value) => setField<double>('totalvalor', value);
}
