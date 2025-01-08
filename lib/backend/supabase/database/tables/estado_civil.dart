import '../database.dart';

class EstadoCivilTable extends SupabaseTable<EstadoCivilRow> {
  @override
  String get tableName => 'EstadoCivil';

  @override
  EstadoCivilRow createRow(Map<String, dynamic> data) => EstadoCivilRow(data);
}

class EstadoCivilRow extends SupabaseDataRow {
  EstadoCivilRow(super.data);

  @override
  SupabaseTable get table => EstadoCivilTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get estadocivilteste => getField<String>('estadocivilteste');
  set estadocivilteste(String? value) =>
      setField<String>('estadocivilteste', value);
}
