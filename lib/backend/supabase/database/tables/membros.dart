import '../database.dart';

class MembrosTable extends SupabaseTable<MembrosRow> {
  @override
  String get tableName => 'Membros';

  @override
  MembrosRow createRow(Map<String, dynamic> data) => MembrosRow(data);
}

class MembrosRow extends SupabaseDataRow {
  MembrosRow(super.data);

  @override
  SupabaseTable get table => MembrosTable();

  int get idMembro => getField<int>('IdMembro')!;
  set idMembro(int value) => setField<int>('IdMembro', value);

  String? get nome => getField<String>('Nome');
  set nome(String? value) => setField<String>('Nome', value);

  String? get endereco => getField<String>('Endereco');
  set endereco(String? value) => setField<String>('Endereco', value);

  String? get bairro => getField<String>('Bairro');
  set bairro(String? value) => setField<String>('Bairro', value);

  String? get cidade => getField<String>('Cidade');
  set cidade(String? value) => setField<String>('Cidade', value);

  String? get cep => getField<String>('Cep');
  set cep(String? value) => setField<String>('Cep', value);

  String? get email => getField<String>('Email');
  set email(String? value) => setField<String>('Email', value);

  String? get senha => getField<String>('Senha');
  set senha(String? value) => setField<String>('Senha', value);

  String? get estadoCivil => getField<String>('EstadoCivil');
  set estadoCivil(String? value) => setField<String>('EstadoCivil', value);

  String? get cpf => getField<String>('Cpf');
  set cpf(String? value) => setField<String>('Cpf', value);

  String? get fotoPerfil => getField<String>('FotoPerfil');
  set fotoPerfil(String? value) => setField<String>('FotoPerfil', value);

  String? get telefone => getField<String>('Telefone');
  set telefone(String? value) => setField<String>('Telefone', value);

  String? get adminMembro => getField<String>('AdminMembro');
  set adminMembro(String? value) => setField<String>('AdminMembro', value);

  String? get status => getField<String>('Status');
  set status(String? value) => setField<String>('Status', value);

  int? get idAdmMembGuiaFF => getField<int>('Id_AdmMemb_GuiaFF');
  set idAdmMembGuiaFF(int? value) => setField<int>('Id_AdmMemb_GuiaFF', value);
}
