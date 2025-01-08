import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
  }) =>
      [ptText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'fytfi3m1': {
      'pt': 'LIONS   CLUB',
      'en': 'LIONS CLUB',
    },
    '7bxmkgwu': {
      'pt': 'Bem vindo!',
      'en': 'Welcome!',
    },
    '3ewux53g': {
      'pt': 'Servimos ao um mundo carente',
      'en': 'We serve a world in need',
    },
    'ntr0m1k8': {
      'pt': '',
      'en': '',
    },
    'sthoqunn': {
      'pt': 'Selecione',
      'en': 'Select',
    },
    '1ngj5lwv': {
      'pt': 'Buscar...',
      'en': 'Search...',
    },
    'od4nvb9s': {
      'pt': 'ID da Conta Leão',
      'en': 'Lion Account ID',
    },
    'q6xcv8he': {
      'pt': 'Digite seu gmail ',
      'en': 'Enter your gmail',
    },
    'a5wpjkqq': {
      'pt': 'Senha',
      'en': 'Password',
    },
    'm6vdfx72': {
      'pt': 'Digite sua senha',
      'en': 'Enter your password',
    },
    'y251hky6': {
      'pt': 'Entrar',
      'en': 'To enter',
    },
    'i8mlzu8x': {
      'pt': 'Registrar ou redefinir senha',
      'en': 'Register or reset password',
    },
    'tb0eptlc': {
      'pt': 'LC6- Taquaritinga',
      'en': 'LC6- Taquaritinga',
    },
    '7wl2cewc': {
      'pt': 'LIONS   CLUB',
      'en': 'LIONS CLUB',
    },
    '3c7v8ch8': {
      'pt': 'Bem vindo!',
      'en': 'Welcome!',
    },
    'mvfx6axl': {
      'pt': 'Servimos ao um mundo carente',
      'en': 'We serve a world in need',
    },
    'mgvwzbil': {
      'pt': 'ID da Conta  Leão',
      'en': 'Lion Account ID',
    },
    'vh7km9q1': {
      'pt': 'Digite seu CPF',
      'en': 'Enter your CPF',
    },
    'tzibx2gn': {
      'pt': 'Senha',
      'en': 'Password',
    },
    'b5uojyzd': {
      'pt': 'Digite sua senha',
      'en': 'Enter your password',
    },
    '9as1uwic': {
      'pt': 'Entrar',
      'en': 'To enter',
    },
    'zsvr1xo3': {
      'pt': 'Lembrar Usuário',
      'en': 'Remember User',
    },
    'et9woe14': {
      'pt': 'LC6- Taquaritinga',
      'en': 'LC6- Taquaritinga',
    },
    'owr84ik1': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // Home
  {
    'v033yvli': {
      'pt': 'Onde há necessidade há um Leão.',
      'en': 'Where there is a need there is a Lion.',
    },
    'joj82i81': {
      'pt': 'Membros ',
      'en': 'Members',
    },
    'fcbntoa1': {
      'pt': 'ADM',
      'en': 'ADM',
    },
    'xdl14gym': {
      'pt': 'Secretaria',
      'en': 'Secretary',
    },
    'h76kskzz': {
      'pt': 'Membros',
      'en': 'Members',
    },
    '15rp25bj': {
      'pt': 'Reuniões/ATA',
      'en': 'Meetings/ATA',
    },
    'a69vuml3': {
      'pt': 'Eventos',
      'en': 'Events',
    },
    '3vba0o6h': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // PerfilMembro
  {
    'l5g8lxah': {
      'pt': 'Sua conta',
      'en': 'Your account',
    },
    'h3ybpf0p': {
      'pt': 'Ajustes',
      'en': 'Settings',
    },
    'm7zuc562': {
      'pt': 'Editar Perfil',
      'en': 'Edit Profile',
    },
    'girit0rg': {
      'pt': 'Configuração de notificação',
      'en': 'Notification configuration',
    },
    'p8ip4b7x': {
      'pt': 'Termos de serviço',
      'en': 'Terms of Service',
    },
    'jwfdlbxt': {
      'pt': 'Sair',
      'en': 'Exit',
    },
    'g6q3mnpg': {
      'pt': 'Olá ',
      'en': 'Hello',
    },
    'cl1swuqo': {
      'pt': 'Olá  Membro  !',
      'en': 'Hello Member!',
    },
    't72uhqrp': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // editarPerfil
  {
    'xnwonrdx': {
      'pt': 'Nome',
      'en': 'Name',
    },
    's0tdm3df': {
      'pt': 'E-mail',
      'en': 'E-mail',
    },
    'x0sivs0n': {
      'pt': 'Estado Civíl',
      'en': 'Marital status',
    },
    '4e82xtzc': {
      'pt': 'Ocupação',
      'en': 'Occupation',
    },
    'sso3gjac': {
      'pt': 'Telefone',
      'en': 'Telephone',
    },
    'hgxp83k4': {
      'pt': 'Editar Logradouro',
      'en': 'Edit Street',
    },
    'xs9frjnv': {
      'pt': 'Salvar Alterações',
      'en': 'Save Changes',
    },
    'p98cgu1l': {
      'pt': 'Editar Perfil',
      'en': 'Edit Profile',
    },
    'c5hfx5ej': {
      'pt': '-----------------------------',
      'en': '-----------------------------',
    },
  },
  // EditarLogradouro
  {
    'ou6tproj': {
      'pt': 'Cep',
      'en': 'Zip code',
    },
    'ycaqcy0d': {
      'pt': 'Salvar Alterações',
      'en': 'Save Changes',
    },
    '7rrut97p': {
      'pt': 'Editar o Logradouro',
      'en': 'Edit the Street',
    },
    '16grf6od': {
      'pt': '----------------------------------------',
      'en': '----------------------------------------',
    },
  },
  // events
  {
    'onujbrl6': {
      'pt': 'Meus Ingressos',
      'en': 'Entry Control',
    },
    'tgggkvvq': {
      'pt': 'Data:',
      'en': 'Date:',
    },
    'v2yvcdre': {
      'pt': 'Horário:',
      'en': 'Time:',
    },
    'ne8oqc1x': {
      'pt': 'Descrição:',
      'en': 'Description:',
    },
    'bxsrv3fg': {
      'pt': 'Ingresso:',
      'en': 'Admission:',
    },
    'j3a0t8ld': {
      'pt': 'Cadastrar Ingresso',
      'en': 'Register Ticket',
    },
    '7i84mi6u': {
      'pt': 'Eventos',
      'en': 'Events',
    },
    'a392fpey': {
      'pt': '-------------------',
      'en': '-------------------',
    },
    'szkkt936': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // notifhistory
  {
    'huvt9445': {
      'pt': 'Histórico',
      'en': 'History',
    },
    '0hk7hzf9': {
      'pt': '-----------------------------',
      'en': '-----------------------------',
    },
    '4bq1cr12': {
      'pt': 'Novo recurso adicionado',
      'en': 'New feature added',
    },
    'cv91d5vv': {
      'pt': 'Confira o novo recurso de chat em grupo',
      'en': 'Check out the new group chat feature',
    },
    '1xp0o1g1': {
      'pt': 'Ontem',
      'en': 'Yesterday',
    },
    'kvjgnsrd': {
      'pt': 'Manutenção concluída',
      'en': 'Maintenance completed',
    },
    'u0n7w0f7': {
      'pt': 'A manutenção programada foi concluída',
      'en': 'Scheduled maintenance has been completed',
    },
    '4n9qksy4': {
      'pt': '3 dias atrás',
      'en': '3 days ago',
    },
    'gt2qqav0': {
      'pt': 'Alerta de segurança',
      'en': 'Security Alert',
    },
    'mxamdp1q': {
      'pt': 'Tentativa de login suspeita detectada',
      'en': 'Suspicious login attempt detected',
    },
    'zukbmz2g': {
      'pt': '1 semana atrás',
      'en': '1 week ago',
    },
    '2mmtqath': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // notific
  {
    'xizbffxe': {
      'pt': 'Notificações',
      'en': 'Notifications',
    },
    '68m1jvjk': {
      'pt': '-----------------------------',
      'en': '-----------------------------',
    },
    'jet7jbvl': {
      'pt': 'Permissões para Notificação',
      'en': 'Notification Permissions',
    },
    'i1nd233a': {
      'pt': 'Reuniões',
      'en': 'Meetings',
    },
    'xxxmwe4u': {
      'pt': 'Receba aviso de reuniões.',
      'en': 'Receive notice of meetings.',
    },
    'aln3rhs4': {
      'pt': 'Histórico de notificações',
      'en': 'Notification history',
    },
    'eadw2ybv': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // ATAfuncional
  {
    '9vep31nd': {
      'pt': 'ATAS',
      'en': 'ATAS',
    },
    '23srny60': {
      'pt': '----------------',
      'en': '----------------',
    },
    'rxsa83gi': {
      'pt': 'Data: ',
      'en': 'Date:',
    },
    'fkds42nf': {
      'pt': 'Horário: ',
      'en': 'Time:',
    },
    'r1d8uccz': {
      'pt': 'Descrição: ',
      'en': 'Description:',
    },
    'o8iu6bpf': {
      'pt': 'Abrir ATA',
      'en': 'Open ATA',
    },
    'v85hcray': {
      'pt': 'Reunião',
      'en': 'Meeting',
    },
    'j6lr09rh': {
      'pt': 'Data:',
      'en': 'Date:',
    },
    '9upb8bye': {
      'pt': '00/00/0000',
      'en': '00/00/0000',
    },
    'c5hoki0r': {
      'pt': 'Horário:',
      'en': 'Time:',
    },
    '8l0jx28t': {
      'pt': '[]',
      'en': '[]',
    },
    '3p7rciq3': {
      'pt': 'Status:',
      'en': 'Status:',
    },
    'n8yak3bb': {
      'pt': '[]',
      'en': '[]',
    },
    '6t4rjz1n': {
      'pt': 'Abrir ATA',
      'en': 'Open ATA',
    },
    'sq3xs84u': {
      'pt': 'Reunião',
      'en': 'Meeting',
    },
    'fszycyeq': {
      'pt': 'Data:',
      'en': 'Date:',
    },
    '2uqbacpc': {
      'pt': '00/00/0000',
      'en': '00/00/0000',
    },
    'n3p9acmh': {
      'pt': 'Horário:',
      'en': 'Time:',
    },
    '56o7wvek': {
      'pt': '[]',
      'en': '[]',
    },
    'phji7gdj': {
      'pt': 'Status:',
      'en': 'Status:',
    },
    'soi46tg7': {
      'pt': '[]',
      'en': '[]',
    },
    'mig8kajl': {
      'pt': 'Abrir ATA',
      'en': 'Open ATA',
    },
    'wt18tsmh': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // CadastrarIngresso
  {
    'f9tnmkt5': {
      'pt': 'Qual a data da venda?',
      'en': 'What is the date of sale?',
    },
    '40oj1hed': {
      'pt': 'Quantos ingressos você vendeu?',
      'en': 'How many tickets did you sell?',
    },
    'f5z9j5s9': {
      'pt': 'Valor do Ingresso:',
      'en': 'Ticket Price:',
    },
    'fae7mzsk': {
      'pt': 'Hello World',
      'en': 'Hello World',
    },
    'v48er3ei': {
      'pt': '',
      'en': '',
    },
    'ejrgk2f8': {
      'pt': 'Cadastrar',
      'en': 'Register',
    },
    'hx94zlmk': {
      'pt': 'Cadastrar Ingresso',
      'en': 'Register Ticket',
    },
    'ij2ki4o2': {
      'pt': '--------------------------------------',
      'en': '--------------------------------------',
    },
    'c22htaq4': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // ListMembros
  {
    'mhgp2sxs': {
      'pt': ' Membros',
      'en': 'Members',
    },
    '9p0olrra': {
      'pt': '-----------------------',
      'en': '-----------------------',
    },
    '5zh1ndao': {
      'pt': 'Membros',
      'en': 'Members',
    },
    'jo8t842h': {
      'pt': '',
      'en': '',
    },
    '4hbzau4c': {
      'pt': '',
      'en': '',
    },
    'og45a39p': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // CadastroEvento
  {
    'yrtv71b2': {
      'pt': 'Nome do Evento:',
      'en': 'Event Name:',
    },
    'o6680wgt': {
      'pt': '',
      'en': '',
    },
    'j9ptkzvz': {
      'pt': 'Evento',
      'en': 'Event',
    },
    'vi0tmc7w': {
      'pt': 'Data do Evento:',
      'en': 'Event Date:',
    },
    'n2tlx367': {
      'pt': 'Horário do Evento:',
      'en': 'Event Time:',
    },
    'q9gxdsb2': {
      'pt': 'Descrição:',
      'en': 'Description:',
    },
    '1wxh4gjj': {
      'pt': '',
      'en': '',
    },
    '5jk9p9mj': {
      'pt': 'Descrição',
      'en': 'Description',
    },
    'fy6bibjs': {
      'pt': 'Valor do ingresso do Evento:',
      'en': 'Event Ticket Price:',
    },
    'ci1nt7op': {
      'pt': 'Cadastrar',
      'en': 'Register',
    },
    'ks68ls0i': {
      'pt': 'Cadastrar Eventos',
      'en': 'Register Events',
    },
    '06thccj2': {
      'pt': '-------------------------------------',
      'en': '-------------------------------------',
    },
    'ar8far5k': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // CadastroMembro
  {
    'y52tu6vn': {
      'pt': 'Nome:',
      'en': 'Name:',
    },
    'uj8yfw84': {
      'pt': 'Nome',
      'en': 'Name',
    },
    'x5dffo0q': {
      'pt': 'Email:',
      'en': 'E-mail:',
    },
    'amqa81v9': {
      'pt': '',
      'en': '',
    },
    '5a8rm9i8': {
      'pt': 'Email',
      'en': 'E-mail',
    },
    'n4nhnghq': {
      'pt': '',
      'en': '',
    },
    'yhfd1hgj': {
      'pt': 'CPF:',
      'en': 'CPF:',
    },
    'pgng2i4r': {
      'pt': '',
      'en': '',
    },
    'hvo8qtq3': {
      'pt': 'CPF',
      'en': 'CPF',
    },
    'a6r6i34t': {
      'pt': '',
      'en': '',
    },
    'j3n6r3ye': {
      'pt': 'Telefone:',
      'en': 'Telephone:',
    },
    'c6ed1kph': {
      'pt': 'Telefone',
      'en': 'Telephone',
    },
    '4lmqe7qj': {
      'pt': 'Estado Civil:',
      'en': 'Marital status:',
    },
    '8kek4eqw': {
      'pt': 'Selecione',
      'en': 'Select',
    },
    'qivv20sz': {
      'pt': 'Search...',
      'en': 'Search...',
    },
    'frqz1h9k': {
      'pt': 'Ocupação:',
      'en': 'Occupation:',
    },
    'p7qxsx2r': {
      'pt': 'Selecione',
      'en': 'Select',
    },
    'bvnei6yf': {
      'pt': 'Search...',
      'en': 'Search...',
    },
    'ff4bar0q': {
      'pt': 'Salvar',
      'en': 'Save',
    },
    'qq0daiol': {
      'pt': 'Limpar',
      'en': 'To clean',
    },
    '804pbaj5': {
      'pt': 'Editar',
      'en': 'Edit',
    },
    '816xlnx8': {
      'pt': 'Cadastrar Membro',
      'en': 'Register Member',
    },
    'zovz5ck1': {
      'pt': '-------------------------------------',
      'en': '-------------------------------------',
    },
    'vv3q8l0o': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // CriarSenha
  {
    'w9cmmzz6': {
      'pt': 'Criar ou Redefinir senha',
      'en': 'Create or Reset Password',
    },
    'dvey9u61': {
      'pt': 'após realizar a ação volte e faça login ',
      'en': 'After performing the action, go back and log in',
    },
    'r3m1hrbz': {
      'pt': 'ID da Conta Leão',
      'en': 'Lion Account ID',
    },
    '2yf0trdb': {
      'pt': 'Digite seu email',
      'en': 'Enter your email',
    },
    '1pxw9hx5': {
      'pt': 'CPF',
      'en': 'CPF',
    },
    'bvlnd361': {
      'pt': 'Digite seu CPF',
      'en': 'Enter your CPF',
    },
    't768s7th': {
      'pt': 'Senha',
      'en': 'Password',
    },
    '1f5yq9me': {
      'pt': 'Digite uma senha',
      'en': 'Enter a password',
    },
    '0h61kqki': {
      'pt': 'Confirmar Senha',
      'en': 'Confirm Password',
    },
    '6lq2ltzv': {
      'pt': 'Confirme a senha',
      'en': 'Confirm password',
    },
    'wnd765gn': {
      'pt': 'criar senha',
      'en': 'create password',
    },
    '0mxi195s': {
      'pt': 'Home',
      'en': '',
    },
  },
  // ContrdeIngreADMLixooooo
  {
    '4h30dqef': {
      'pt': 'Controle de Ingressos',
      'en': 'Ticket Control',
    },
    'lp8a2vvl': {
      'pt': '--------------------------------------------',
      'en': '----------------------------',
    },
    'p8fxg6q7': {
      'pt': 'Ingressos vendidos:',
      'en': 'Tickets sold:',
    },
    'uzlx4v6z': {
      'pt': 'Valor ao todo:',
      'en': 'Total value:',
    },
    '3xx5b29h': {
      'pt': 'Detalhes...',
      'en': 'Details...',
    },
    'sqztbtnv': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // HomeADM
  {
    'ouw76fpn': {
      'pt': 'Onde há necessidade há um Leão.',
      'en': 'Where there is a need there is a Lion.',
    },
    'nas8293k': {
      'pt': 'Membros ',
      'en': 'Members',
    },
    'x9we9ljm': {
      'pt': 'ADM',
      'en': 'ADM',
    },
    'e642t528': {
      'pt': 'Secretaria',
      'en': 'Secretary',
    },
    'zypy03zt': {
      'pt': 'Membros',
      'en': 'Members',
    },
    '8bafxywi': {
      'pt': 'Reuniões/ATA',
      'en': 'Meetings/ATA',
    },
    'jvfya36t': {
      'pt': 'Eventos',
      'en': 'Events',
    },
    '0cu54f4l': {
      'pt': 'Cadastrar Reunião',
      'en': 'Register Meeting',
    },
    'ynkpzbxp': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // CadastrarAta
  {
    'shcp55i2': {
      'pt': 'Título:',
      'en': 'Title:',
    },
    'm4si74bn': {
      'pt': '',
      'en': '',
    },
    'x1fejt6n': {
      'pt': 'Título',
      'en': 'Title',
    },
    'junb8li3': {
      'pt': 'Local:',
      'en': 'Location:',
    },
    'eortnrks': {
      'pt': 'Data:',
      'en': 'Date:',
    },
    'puwg4sr5': {
      'pt': 'Selecione...',
      'en': 'Select...',
    },
    'y2pvckre': {
      'pt': 'Search...',
      'en': '',
    },
    'hk81ztfr': {
      'pt': 'Horário:',
      'en': 'Time:',
    },
    'dqboah53': {
      'pt': 'Descrição:',
      'en': 'Description:',
    },
    'c0sxrtaf': {
      'pt': 'Descrição',
      'en': 'Description',
    },
    'cma4usbv': {
      'pt': 'Arquivo ATA:',
      'en': 'ATA File:',
    },
    'gigi9yab': {
      'pt': 'Browse File',
      'en': 'Browse File',
    },
    'wgozpoac': {
      'pt': 'Cadastrar',
      'en': 'Register',
    },
    '7ihxyb3b': {
      'pt': 'Cadastrar ATA',
      'en': 'Register ATA',
    },
    'qsrmo8lk': {
      'pt': '---------------------------------',
      'en': '---------------------------------',
    },
    'kq4uguj4': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // ATAAdm
  {
    '1kel31n5': {
      'pt': 'Cadastrar ATA',
      'en': 'Register ATA',
    },
    '1k87jajr': {
      'pt': 'Data: ',
      'en': 'Date:',
    },
    'm38cd662': {
      'pt': 'Horário: ',
      'en': 'Time:',
    },
    '353gwy35': {
      'pt': 'Local: ',
      'en': 'Location:',
    },
    '0lgg0iw0': {
      'pt': 'Abrir ATA',
      'en': 'Open ATA',
    },
    'lu7t3d7d': {
      'pt': 'Reunião',
      'en': 'Meeting',
    },
    'c0qmyr63': {
      'pt': 'Data:',
      'en': 'Date:',
    },
    '46oroa53': {
      'pt': '00/00/0000',
      'en': '00/00/0000',
    },
    '7tgz0fb6': {
      'pt': 'Horário:',
      'en': 'Time:',
    },
    'hz0hxqzf': {
      'pt': '[]',
      'en': '[]',
    },
    'kuo9cpmp': {
      'pt': 'Status:',
      'en': 'Status:',
    },
    'p9djavr8': {
      'pt': '[]',
      'en': '[]',
    },
    'tc77fvil': {
      'pt': 'Abrir ATA',
      'en': 'Open ATA',
    },
    'hoe4mx91': {
      'pt': 'Reunião',
      'en': 'Meeting',
    },
    'o0xo9qxk': {
      'pt': 'Data:',
      'en': 'Date:',
    },
    'usq8hlz2': {
      'pt': '00/00/0000',
      'en': '00/00/0000',
    },
    'trxph0wi': {
      'pt': 'Horário:',
      'en': 'Time:',
    },
    'hhs7hglf': {
      'pt': '[]',
      'en': '[]',
    },
    '8sgzf1qs': {
      'pt': 'Status:',
      'en': 'Status:',
    },
    'd9bwy781': {
      'pt': '[]',
      'en': '[]',
    },
    '4m3yk0ug': {
      'pt': 'Abrir ATA',
      'en': 'Open ATA',
    },
    's9ldpi1o': {
      'pt': 'ATAS',
      'en': 'ATAS',
    },
    'nljhqv9h': {
      'pt': '----------------',
      'en': '----------------',
    },
    'ywwfyr5g': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // eventesADM
  {
    '0im838ms': {
      'pt': 'Cadastrar Evento',
      'en': 'Register Event',
    },
    'ddr49o73': {
      'pt': 'Controle de Ingresso',
      'en': 'Ticket control',
    },
    '0et5t9qx': {
      'pt': 'Meus Ingressos',
      'en': 'My Tickets',
    },
    'ititu1f9': {
      'pt': 'Data:',
      'en': 'Date:',
    },
    '8tjbf88o': {
      'pt': 'Horário:',
      'en': 'Time:',
    },
    'mv33wik1': {
      'pt': 'Descrição:',
      'en': 'Description:',
    },
    'quz5ghm9': {
      'pt': 'Valor do Ingresso:',
      'en': 'Admission:',
    },
    'b3o4kq53': {
      'pt': 'Cadastrar Ingresso',
      'en': 'Register Ticket',
    },
    'fl671rxi': {
      'pt': 'Eventos',
      'en': 'Events',
    },
    '6w08xtii': {
      'pt': '-----------------',
      'en': '-----------------',
    },
    'l5jhx7ac': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // InforMemb
  {
    '23hn5l3d': {
      'pt': 'Buscar Membro',
      'en': 'Search Member',
    },
    'takikru9': {
      'pt': '---------------------------------',
      'en': '---------------------------------',
    },
    '9pehtsw4': {
      'pt': 'Administrar os membros.',
      'en': 'Manage members.',
    },
    'il2umwji': {
      'pt': 'Gerenciar Membro',
      'en': 'Manage Member',
    },
    '9b0p424z': {
      'pt': 'Mostrar Membros Desativados',
      'en': 'Show Disabled Members',
    },
    '3f5hmahi': {
      'pt': 'Habilitar',
      'en': 'Enable',
    },
    'vh9lxc5m': {
      'pt': '5 mins ago',
      'en': '5 mins ago',
    },
    'im3j8br1': {
      'pt': 'Head of Design',
      'en': 'Head of Design',
    },
    '27mvyvew': {
      'pt': 'Home',
      'en': '',
    },
  },
  // PerfilADM
  {
    'zlyprzgx': {
      'pt': 'Sua conta',
      'en': 'Your account',
    },
    'bu8tqma3': {
      'pt': 'Ajustes',
      'en': 'Settings',
    },
    'f4g84cv8': {
      'pt': 'Editar Perfil',
      'en': 'Edit Profile',
    },
    'kd19a6ev': {
      'pt': 'Configuração de notificação',
      'en': 'Notification configuration',
    },
    '4vnyvi67': {
      'pt': 'Termos de serviço',
      'en': 'Terms of Service',
    },
    '2qvmtlnt': {
      'pt': 'Sair',
      'en': 'To go out',
    },
    '0w3f7r30': {
      'pt': 'Olá',
      'en': 'Hello',
    },
    '33m9sj9z': {
      'pt': 'Olá  Membro  !',
      'en': 'Hello Member!',
    },
    'iv7tyixn': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // ATAVisu
  {
    'npbzq26a': {
      'pt': 'Titulo',
      'en': 'Title',
    },
    'ec1mb8rp': {
      'pt': 'Local',
      'en': 'Location',
    },
    '1ccodv5s': {
      'pt': 'Data',
      'en': 'Date',
    },
    '5j68fky2': {
      'pt': 'Hora',
      'en': 'Time',
    },
    'lt30wury': {
      'pt': 'Descricao',
      'en': 'Description',
    },
    'k471bz2t': {
      'pt': 'visualizar arquivo',
      'en': 'view file',
    },
    '7tk6f7pr': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // ATAPreview
  {
    'fha5s3k3': {
      'pt': 'Imprimir',
      'en': 'Print',
    },
    'jq73h72t': {
      'pt': 'ATA - Preview',
      'en': 'ATA - Preview',
    },
    'z5df4f9v': {
      'pt': '------------------------------',
      'en': '------------------------------',
    },
    '4lwzcnuj': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // Usu_MeusIngressos
  {
    '0r9d8v60': {
      'pt': 'Ingressos vendidos:',
      'en': 'Tickets sold:',
    },
    '2tavdhq1': {
      'pt': 'Valor ao todo:',
      'en': 'Total value:',
    },
    'b6hf2pja': {
      'pt': 'Editar...',
      'en': 'Details...',
    },
    'vp7jd8yq': {
      'pt': 'Meus Ingressos',
      'en': 'Ticket Control',
    },
    'knq6xdao': {
      'pt': '------------------------------',
      'en': '----------------------------',
    },
    '0ewdv0sh': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // ContrdeIngreADMFuncional
  {
    'gxl1yiql': {
      'pt': 'Controle de Ingressos',
      'en': 'Ticket Control',
    },
    'wiw5q2yy': {
      'pt': '--------------------------------------------',
      'en': '----------------------------',
    },
    'bemx2wsm': {
      'pt': 'Ingressos Vendidos:',
      'en': 'Description:',
    },
    'uujo15hp': {
      'pt': 'Valor Total:',
      'en': 'Admission:',
    },
    'cy4g8l3l': {
      'pt': 'Valor do Ingresso:',
      'en': 'Description:',
    },
    '00937rg8': {
      'pt': 'Home',
      'en': 'Home',
    },
  },
  // mode
  {
    'pr8f941d': {
      'pt': 'Modo claro',
      'en': 'Light mode',
    },
    'b3uxm1yy': {
      'pt': 'Modo escuro',
      'en': 'Dark mode',
    },
  },
  // ErroAlert
  {
    '97qqkod9': {
      'pt': 'Erro',
      'en': 'Error',
    },
    'cyas0sqm': {
      'pt': 'OK',
      'en': 'OK',
    },
  },
  // menu
  {
    'm6petyb8': {
      'pt': 'MENU',
      'en': 'MENU',
    },
    '2f06sxfy': {
      'pt': 'Lista de membros',
      'en': 'Member List',
    },
    '9cb0wshs': {
      'pt': 'Reuniões',
      'en': 'Meetings',
    },
    'lus9ygfc': {
      'pt': 'Venda de ingressos',
      'en': 'Ticket sales',
    },
  },
  // terms
  {
    'esy5o72u': {
      'pt': 'Terms of Service',
      'en': 'Terms of Service',
    },
    'qm4vlbga': {
      'pt': 'Normas de Privacidade',
      'en': 'Privacy Policy',
    },
    'e9emensy': {
      'pt': 'Voltar',
      'en': 'To go back',
    },
  },
  // menuADM
  {
    '7bxblvh8': {
      'pt': 'MENU',
      'en': 'MENU',
    },
    'p05s6pw6': {
      'pt': 'Sair',
      'en': 'Exit',
    },
  },
  // modeADM
  {
    'diqjke6v': {
      'pt': 'Modo Claro',
      'en': 'Light Mode',
    },
    'xvtfm2rg': {
      'pt': 'Modo Escuro',
      'en': 'Dark Mode',
    },
  },
  // CadastroReuniao
  {
    '9xhmdp6e': {
      'pt': 'Cadastrar Reunião',
      'en': 'Register Meeting',
    },
    '5r1aug34': {
      'pt': 'Data',
      'en': 'Date ',
    },
    '9usgnf6z': {
      'pt': 'Horário',
      'en': 'Time',
    },
    'iathiu2f': {
      'pt': 'Local',
      'en': 'Location',
    },
    '845q1i5f': {
      'pt': 'Cadastrar Reunião',
      'en': 'Register Meeting',
    },
  },
  // notificationPersonalizada
  {
    '3ab5699y': {
      'pt': 'Alerta De Registro',
      'en': 'Registration Alert',
    },
    'i6253ww1': {
      'pt': 'O Cadastro da Reunião foi Bem sucedido!',
      'en': 'Meeting Registration Successful!',
    },
  },
  // MembTal
  {
    'g4f1mf1d': {
      'pt': 'Email:',
      'en': 'E-mail:',
    },
    'eg30qnue': {
      'pt': 'CPF:',
      'en': 'CPF:',
    },
    'ih3goaed': {
      'pt': 'Telefone:',
      'en': 'Telephone:',
    },
    'ixyeigui': {
      'pt': 'Estado Civil:',
      'en': 'Marital status:',
    },
    'ckp9cpim': {
      'pt': 'Ocupação:',
      'en': 'Occupation:',
    },
    'zowcivgf': {
      'pt': 'Status:',
      'en': 'Status:',
    },
    'hjyulazv': {
      'pt': 'ID:',
      'en': 'ID:',
    },
  },
  // EditarMembro
  {
    'q8lgbqwf': {
      'pt': 'Buscar Membro',
      'en': 'Search Member',
    },
    'x2rxd6p6': {
      'pt': 'Nome:',
      'en': 'Name:',
    },
    'j9gy4vy3': {
      'pt': '',
      'en': '',
    },
    'vy8x4c8n': {
      'pt': 'Nome',
      'en': 'Name',
    },
    '7naz9h7l': {
      'pt': '',
      'en': '',
    },
    'vb10mv0z': {
      'pt': 'Email:',
      'en': 'E-mail:',
    },
    'v4hohgvv': {
      'pt': '',
      'en': '',
    },
    '4nnut9mg': {
      'pt': 'Email',
      'en': 'E-mail',
    },
    'r4ri0krb': {
      'pt': '',
      'en': '',
    },
    'ou8p2k73': {
      'pt': 'CPF:',
      'en': 'CPF:',
    },
    '6urwlppk': {
      'pt': 'Cpf',
      'en': '',
    },
    'xgay0bpb': {
      'pt': 'Telefone:',
      'en': 'Telephone:',
    },
    'wavciq43': {
      'pt': '',
      'en': '',
    },
    '80l8tcli': {
      'pt': 'Telefone',
      'en': 'Telephone',
    },
    'igui527f': {
      'pt': 'Ocupação:',
      'en': 'Occupation:',
    },
    '6hzebfto': {
      'pt': 'Selecione',
      'en': 'Select',
    },
    'wdtiysn3': {
      'pt': 'Search...',
      'en': 'Search...',
    },
    '88hd04ib': {
      'pt': 'Status:',
      'en': 'Occupation:',
    },
    '2atyokch': {
      'pt': 'Selecione',
      'en': 'Select',
    },
    'vphmuqn4': {
      'pt': 'Search...',
      'en': 'Search...',
    },
    'hxu6cwj2': {
      'pt': 'ID:',
      'en': 'ID:',
    },
    'uoar2jmh': {
      'pt': 'Id',
      'en': 'Id',
    },
    'hq890ulz': {
      'pt': 'Buscar',
      'en': 'Search',
    },
    'gh3b4en9': {
      'pt': 'Editar',
      'en': 'Edit',
    },
    '1rqpmfjd': {
      'pt': 'Limpar',
      'en': 'To clean',
    },
  },
  // alterarFoto
  {
    'qltz7sw4': {
      'pt': 'Mudar Foto',
      'en': 'Change Photo',
    },
    'qapx8sw1': {
      'pt':
          'Carregue uma nova foto abaixo para alterar seu avatar visto por outros membros.',
      'en':
          'Upload a new photo below to change your avatar as seen by other members.',
    },
    'kfy9q6zx': {
      'pt': 'Carregar imagem',
      'en': 'Upload image',
    },
    'wemowqce': {
      'pt': 'Salvar',
      'en': 'Save',
    },
  },
  // menuAdmNovo
  {
    'psa3bres': {
      'pt': 'MENU',
      'en': 'MENU',
    },
    'tm3x6c1i': {
      'pt': 'Lista de membros',
      'en': 'Member List',
    },
    'apye2mjq': {
      'pt': 'Reuniões',
      'en': 'Meetings',
    },
    '584reett': {
      'pt': 'Venda de ingressos',
      'en': 'Ticket sales',
    },
  },
  // EditarEvent
  {
    '6p8xd355': {
      'pt': 'Editar Evento',
      'en': 'Edit Event',
    },
    'd5q4q106': {
      'pt': 'Nome:',
      'en': 'Name:',
    },
    't0vyxxcw': {
      'pt': '',
      'en': '',
    },
    'c961u8fg': {
      'pt': 'Nome',
      'en': 'Name',
    },
    'z9fyl9p5': {
      'pt': '',
      'en': '',
    },
    '6mqpf9pl': {
      'pt': 'Data:',
      'en': 'Date:',
    },
    'y2hthos1': {
      'pt': 'Hórario:',
      'en': 'Time:',
    },
    'upitqhn4': {
      'pt': 'Descrição:',
      'en': 'Description:',
    },
    'r1eq43me': {
      'pt': 'Descrição',
      'en': 'Description',
    },
    '6vlg4uh3': {
      'pt': 'Valor:',
      'en': 'Value:',
    },
    'f26olzff': {
      'pt': 'Editar',
      'en': 'Edit',
    },
  },
  // EditarIngresso
  {
    'f0z2phqb': {
      'pt': 'Editar Ingresso',
      'en': 'Edit Ticket',
    },
    'bzmiwvr7': {
      'pt': 'Quantidade:',
      'en': 'Amount:',
    },
    'h9ll2z1q': {
      'pt': '',
      'en': '',
    },
    '7unduq3c': {
      'pt': 'Quantidade',
      'en': 'Amount',
    },
    'nhsgv7kh': {
      'pt': 'Data da Venda:',
      'en': 'Date of Sale:',
    },
    'qujjg4jv': {
      'pt': 'Deletar',
      'en': 'Edit',
    },
    'cn4cuafd': {
      'pt': 'Editar',
      'en': 'Edit',
    },
  },
  // Miscellaneous
  {
    '1o2odtua': {
      'pt': 'Hello World',
      'en': 'Hello World',
    },
    'j3wgnv00': {
      'pt': 'TextField',
      'en': '',
    },
    'd8i0xeoc': {
      'pt':
          'O aplicativo requer algumas permissões para funcionar corretamente',
      'en': 'The app requires some permissions to work properly.',
    },
    'wpy5s4va': {
      'pt':
          'O aplicativo requer algumas permissões para funcionar corretamente',
      'en': 'The app requires some permissions to work properly.',
    },
    'ggnwx9rz': {
      'pt': '',
      'en': '',
    },
    'vdtaqynz': {
      'pt':
          'O aplicativo requer algumas permissões para funcionar corretamente',
      'en': 'The app requires some permissions to work properly.',
    },
    'e9qdc9y0': {
      'pt': 'Erro:[error]',
      'en': 'Error:[error]',
    },
    '237f8fjn': {
      'pt': 'E-mail de redefinição de senha enviado!',
      'en': 'Password reset email sent!',
    },
    'nh4hn49e': {
      'pt': 'E-mail obrigatório!',
      'en': 'Email required!',
    },
    'abarvl9e': {
      'pt': 'Número de telefone obrigatório e deve começar com +.',
      'en': 'Phone number is required and must start with +.',
    },
    'wl7cyahm': {
      'pt': 'A senha não corresponde.',
      'en': 'Password does not match.',
    },
    'qaocbw0m': {
      'pt': 'Digite o código de verificação por SMS.',
      'en': 'Enter the SMS verification code.',
    },
    'zsy242ty': {
      'pt':
          'Já faz muito tempo desde a última inscrição. Inscreva-se novamente antes de excluir sua conta.',
      'en':
          'It\'s been too long since you last signed up. Please sign up again before deleting your account.',
    },
    '5dz32m3h': {
      'pt':
          'Faz muito tempo desde a última inscrição. Entre novamente antes de atualizar seu e-mail.',
      'en':
          'It\'s been a long time since you last signed up. Please sign in again before updating your email.',
    },
    '54w40nz7': {
      'pt': 'E-mail de confirmação de alteração de e-mail enviado!',
      'en': 'Email change confirmation email sent!',
    },
    'gywoow4y': {
      'pt': 'E-mail já em uso por outra conta.',
      'en': 'Email already in use by another account.',
    },
    '5lvbydt9': {
      'pt': 'A credencial de autenticação fornecida está incorreta.',
      'en': 'The authentication credential provided is incorrect.',
    },
    'cvdo4xnb': {
      'pt': 'Formato do arquivo inválido',
      'en': 'Invalid file format',
    },
    '5o47sxt3': {
      'pt': 'Carregando arquivo...',
      'en': 'Loading file...',
    },
    '6xq32bur': {
      'pt': 'Sucesso!',
      'en': 'Success!',
    },
    'z8mg3j0b': {
      'pt': 'Falha ao carregar arquivo',
      'en': 'Failed to load file',
    },
    'steybw87': {
      'pt': '',
      'en': '',
    },
    '79988itj': {
      'pt': 'Escolha a fonte',
      'en': 'Choose the font',
    },
    's7szainv': {
      'pt': 'Galeria',
      'en': 'Gallery',
    },
    'vp3j1o9d': {
      'pt': 'Galeria(Foto)',
      'en': 'Gallery(Photo)',
    },
    '2cab5o3d': {
      'pt': 'Galeria(Video)',
      'en': 'Gallery(Video)',
    },
    '6n3182jo': {
      'pt': 'Câmera',
      'en': 'Camera',
    },
    'dbc61zbr': {
      'pt': '',
      'en': '',
    },
    '3tsm7kph': {
      'pt': '',
      'en': '',
    },
    'gds7oywa': {
      'pt': '',
      'en': '',
    },
    'oss93uo7': {
      'pt': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
