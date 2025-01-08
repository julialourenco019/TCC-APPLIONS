import '../database.dart';

class StatusTable extends SupabaseTable<StatusRow> {
  @override
  String get tableName => 'Status';

  @override
  StatusRow createRow(Map<String, dynamic> data) => StatusRow(data);
}

class StatusRow extends SupabaseDataRow {
  StatusRow(super.data);

  @override
  SupabaseTable get table => StatusTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get status => getField<String>('Status');
  set status(String? value) => setField<String>('Status', value);
}
