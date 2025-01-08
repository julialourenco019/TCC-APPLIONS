import '../database.dart';

class QuantidadeVendasTotalTable
    extends SupabaseTable<QuantidadeVendasTotalRow> {
  @override
  String get tableName => 'quantidade_vendas_total';

  @override
  QuantidadeVendasTotalRow createRow(Map<String, dynamic> data) =>
      QuantidadeVendasTotalRow(data);
}

class QuantidadeVendasTotalRow extends SupabaseDataRow {
  QuantidadeVendasTotalRow(super.data);

  @override
  SupabaseTable get table => QuantidadeVendasTotalTable();

  int? get idEvento => getField<int>('IdEvento');
  set idEvento(int? value) => setField<int>('IdEvento', value);

  int? get totalVendido => getField<int>('total_vendido');
  set totalVendido(int? value) => setField<int>('total_vendido', value);
}
