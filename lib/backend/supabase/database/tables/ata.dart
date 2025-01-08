import '../database.dart';

class AtaTable extends SupabaseTable<AtaRow> {
  @override
  String get tableName => 'ATA';

  @override
  AtaRow createRow(Map<String, dynamic> data) => AtaRow(data);
}

class AtaRow extends SupabaseDataRow {
  AtaRow(super.data);

  @override
  SupabaseTable get table => AtaTable();

  int get idAta => getField<int>('idAta')!;
  set idAta(int value) => setField<int>('idAta', value);

  int? get idReuniao => getField<int>('IdReuniao');
  set idReuniao(int? value) => setField<int>('IdReuniao', value);

  String? get ataTitulo => getField<String>('AtaTitulo');
  set ataTitulo(String? value) => setField<String>('AtaTitulo', value);

  String? get ataDescricao => getField<String>('AtaDescricao');
  set ataDescricao(String? value) => setField<String>('AtaDescricao', value);

  String? get ataPdf => getField<String>('ataPdf');
  set ataPdf(String? value) => setField<String>('ataPdf', value);
}
