import '../database.dart';

class IngressosTable extends SupabaseTable<IngressosRow> {
  @override
  String get tableName => 'Ingressos';

  @override
  IngressosRow createRow(Map<String, dynamic> data) => IngressosRow(data);
}

class IngressosRow extends SupabaseDataRow {
  IngressosRow(super.data);

  @override
  SupabaseTable get table => IngressosTable();

  int get idIngresso => getField<int>('IdIngresso')!;
  set idIngresso(int value) => setField<int>('IdIngresso', value);

  int? get idEvento => getField<int>('IdEvento');
  set idEvento(int? value) => setField<int>('IdEvento', value);

  int? get idMembro => getField<int>('IdMembro');
  set idMembro(int? value) => setField<int>('IdMembro', value);

  double? get valorIngresso => getField<double>('ValorIngresso');
  set valorIngresso(double? value) => setField<double>('ValorIngresso', value);

  int? get quantidadeVenda => getField<int>('QuantidadeVenda');
  set quantidadeVenda(int? value) => setField<int>('QuantidadeVenda', value);

  DateTime get dataVenda => getField<DateTime>('DataVenda')!;
  set dataVenda(DateTime value) => setField<DateTime>('DataVenda', value);

  double? get valorTotal => getField<double>('ValorTotal');
  set valorTotal(double? value) => setField<double>('ValorTotal', value);

  bool? get status => getField<bool>('Status');
  set status(bool? value) => setField<bool>('Status', value);
}
