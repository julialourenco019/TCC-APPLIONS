import '../database.dart';

class ReunioTable extends SupabaseTable<ReunioRow> {
  @override
  String get tableName => 'Reunião';

  @override
  ReunioRow createRow(Map<String, dynamic> data) => ReunioRow(data);
}

class ReunioRow extends SupabaseDataRow {
  ReunioRow(super.data);

  @override
  SupabaseTable get table => ReunioTable();

  int get idReuniao => getField<int>('idReuniao')!;
  set idReuniao(int value) => setField<int>('idReuniao', value);

  DateTime get dataReuniao => getField<DateTime>('DataReuniao')!;
  set dataReuniao(DateTime value) => setField<DateTime>('DataReuniao', value);

  PostgresTime? get horaReuniao => getField<PostgresTime>('HoraReuniao');
  set horaReuniao(PostgresTime? value) =>
      setField<PostgresTime>('HoraReuniao', value);

  String? get localReuniao => getField<String>('LocalReuniao');
  set localReuniao(String? value) => setField<String>('LocalReuniao', value);

  String? get stringData => getField<String>('stringData');
  set stringData(String? value) => setField<String>('stringData', value);

  String? get horarioString => getField<String>('HorarioString');
  set horarioString(String? value) => setField<String>('HorarioString', value);
}
