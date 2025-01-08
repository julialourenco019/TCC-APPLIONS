import '../database.dart';

class AdministradorTable extends SupabaseTable<AdministradorRow> {
  @override
  String get tableName => 'Administrador';

  @override
  AdministradorRow createRow(Map<String, dynamic> data) =>
      AdministradorRow(data);
}

class AdministradorRow extends SupabaseDataRow {
  AdministradorRow(super.data);

  @override
  SupabaseTable get table => AdministradorTable();

  int get idAdmin => getField<int>('idAdmin')!;
  set idAdmin(int value) => setField<int>('idAdmin', value);

  String get adminLogin => getField<String>('AdminLogin')!;
  set adminLogin(String value) => setField<String>('AdminLogin', value);

  String? get adminSenha => getField<String>('AdminSenha');
  set adminSenha(String? value) => setField<String>('AdminSenha', value);
}
