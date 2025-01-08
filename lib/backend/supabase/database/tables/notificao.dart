import '../database.dart';

class NotificaoTable extends SupabaseTable<NotificaoRow> {
  @override
  String get tableName => 'Notificação';

  @override
  NotificaoRow createRow(Map<String, dynamic> data) => NotificaoRow(data);
}

class NotificaoRow extends SupabaseDataRow {
  NotificaoRow(super.data);

  @override
  SupabaseTable get table => NotificaoTable();

  int get idNotificacao => getField<int>('idNotificacao')!;
  set idNotificacao(int value) => setField<int>('idNotificacao', value);

  int? get idMembro => getField<int>('idMembro');
  set idMembro(int? value) => setField<int>('idMembro', value);

  String? get descricao => getField<String>('Descricao');
  set descricao(String? value) => setField<String>('Descricao', value);

  String get titulo => getField<String>('titulo')!;
  set titulo(String value) => setField<String>('titulo', value);

  DateTime get dataField => getField<DateTime>('data')!;
  set dataField(DateTime value) => setField<DateTime>('data', value);
}
