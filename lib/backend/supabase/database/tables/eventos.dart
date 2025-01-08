import '../database.dart';

class EventosTable extends SupabaseTable<EventosRow> {
  @override
  String get tableName => 'Eventos';

  @override
  EventosRow createRow(Map<String, dynamic> data) => EventosRow(data);
}

class EventosRow extends SupabaseDataRow {
  EventosRow(super.data);

  @override
  SupabaseTable get table => EventosTable();

  int get idEvento => getField<int>('idEvento')!;
  set idEvento(int value) => setField<int>('idEvento', value);

  String? get nomeEvento => getField<String>('NomeEvento');
  set nomeEvento(String? value) => setField<String>('NomeEvento', value);

  String? get descricaoEvento => getField<String>('DescricaoEvento');
  set descricaoEvento(String? value) =>
      setField<String>('DescricaoEvento', value);

  DateTime? get dataEvento => getField<DateTime>('DataEvento');
  set dataEvento(DateTime? value) => setField<DateTime>('DataEvento', value);

  double get valorEvento => getField<double>('ValorEvento')!;
  set valorEvento(double value) => setField<double>('ValorEvento', value);

  double? get valorTotal => getField<double>('ValorTotal');
  set valorTotal(double? value) => setField<double>('ValorTotal', value);

  PostgresTime get horaEvento => getField<PostgresTime>('HoraEvento')!;
  set horaEvento(PostgresTime value) =>
      setField<PostgresTime>('HoraEvento', value);

  bool? get status => getField<bool>('Status');
  set status(bool? value) => setField<bool>('Status', value);
}
