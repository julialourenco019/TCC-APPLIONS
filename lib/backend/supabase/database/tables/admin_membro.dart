import '../database.dart';

class AdminMembroTable extends SupabaseTable<AdminMembroRow> {
  @override
  String get tableName => 'AdminMembro';

  @override
  AdminMembroRow createRow(Map<String, dynamic> data) => AdminMembroRow(data);
}

class AdminMembroRow extends SupabaseDataRow {
  AdminMembroRow(super.data);

  @override
  SupabaseTable get table => AdminMembroTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get adminMembroTeste => getField<String>('adminMembroTeste');
  set adminMembroTeste(String? value) =>
      setField<String>('adminMembroTeste', value);
}
