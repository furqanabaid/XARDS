import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['de', 'en'];

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
    String? deText = '',
    String? enText = '',
  }) =>
      [deText, enText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '6pc2tlm0': {
      'de': 'Suchen',
      'en': 'Seek',
    },
    'hqa3gwhn': {
      'de': 'Firma hinzufügen +',
      'en': 'Add company +',
    },
    '3y4zni8k': {
      'de': 'Ihr Unternehmen',
      'en': 'Your business',
    },
    'lkdotrcf': {
      'de': 'Mitarbeiter suchen',
      'en': 'search employees',
    },
    '2ntzvceu': {
      'de': ' ',
      'en': '',
    },
    'd1nfgrpm': {
      'de': 'Name',
      'en': 'Surname',
    },
    'v562u4bb': {
      'de': 'Berufsbezeichnung',
      'en': 'job title',
    },
    'xosoyg9h': {
      'de': 'Select firm',
      'en': 'Select firm',
    },
    'jpoypa6b': {
      'de': 'Selected Employee',
      'en': 'Selected Employee',
    },
    '7yonocs8': {
      'de': 'Vorschau',
      'en': 'preview',
    },
    '5ankyhh4': {
      'de': 'Manage Profile',
      'en': 'Manage Profiles',
    },
    'hielkku0': {
      'de': 'Logout',
      'en': 'logout',
    },
    '5x2i0od1': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // Registration
  {
    '7y5yghp1': {
      'de': 'Willkommen zu XARDS',
      'en': 'Welcome to XARDS',
    },
    'qgxnapo4': {
      'de': 'Anmelden',
      'en': 'Register',
    },
    'cvq7jbhu': {
      'de': 'Geben Sie zum Zurücksetzen Ihre E-Mail-Adresse ein',
      'en': 'Enter your email address to reset',
    },
    '7sr2f4f1': {
      'de': 'stornieren',
      'en': 'cancel',
    },
    '818kqw86': {
      'de': 'Passwort zurücksetzen\n',
      'en': 'reset Password',
    },
    'mhvy3blb': {
      'de': 'Email',
      'en': 'E-mail',
    },
    'ps355euf': {
      'de': 'Passwort',
      'en': 'password',
    },
    '5ckb4wx5': {
      'de': 'Passwort vergessen?',
      'en': 'Forgot Password?',
    },
    'nk4s8ch1': {
      'de': 'Anmelden',
      'en': 'Register',
    },
    '1w5v89p0': {
      'de': 'Anmeldung',
      'en': 'Registration',
    },
    '7ha93xis': {
      'de': 'Ihren Namen',
      'en': 'your name',
    },
    'xncqg9wb': {
      'de': 'Email',
      'en': 'E-mail',
    },
    'nafli97r': {
      'de': 'Passwort',
      'en': 'password',
    },
    'vf0usngs': {
      'de': 'Bestätige das Passwort',
      'en': 'Confirm the password',
    },
    'fyn22dga': {
      'de': 'Neuen Account Erstellen',
      'en': 'Create a new account',
    },
    'ix4w72fl': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    '4xg83j7d': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '0lfetkcf': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'de0w25yy': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'jsw0qgid': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    '02johima': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'n3ygzdja': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'el7h9a0h': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'xluobzzo': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // employeeDetails
  {
    'ebuu7v3c': {
      'de': 'Persönliche Details',
      'en': 'personal details',
    },
    'aqftdvfb': {
      'de': 'Vor- und Nachname',
      'en': 'First and Last Name',
    },
    '8exzdyoj': {
      'de': 'Jobtitel',
      'en': 'job title',
    },
    'opqd2vcq': {
      'de': 'Kurzbeschreibung',
      'en': 'short description',
    },
    'ma3mu0fg': {
      'de': 'Kontaktdetails',
      'en': 'contact details',
    },
    'ooe83ru9': {
      'de': 'Adresse',
      'en': 'address',
    },
    't7lwh1km': {
      'de': 'Social Media',
      'en': 'social media',
    },
    'pa51zhni': {
      'de': 'Als Kontakt speichern',
      'en': 'Save as contact',
    },
    'vrrtpk8q': {
      'de': 'Als Kontakt speichern',
      'en': 'Save as contact',
    },
    'g0ytnpxe': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // selectFirm
  {
    'exs5uf7y': {
      'de': 'Fügen Sie Ihre Firma hinzu',
      'en': 'Add your company',
    },
    '01fjmb9n': {
      'de': 'Erledigt',
      'en': 'Completed',
    },
    'w6tit0c7': {
      'de': 'Firmenname',
      'en': 'company name',
    },
    '4udtantn': {
      'de': 'Hochladen...',
      'en': 'Upload...',
    },
    'fxzjjgcg': {
      'de': 'Logo hochladen',
      'en': 'Upload logo',
    },
    's3t6gubr': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'fyngbovg': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '0p9bohd6': {
      'de': 'Home',
      'en': 'Home',
    },
  },
  // addNewFirm
  {
    '78xczqc7': {
      'de': 'Neue Firma hinzufügen',
      'en': 'Add new company',
    },
    'ajid7tdr': {
      'de': 'Firmenname',
      'en': 'company name',
    },
    'mfowfun3': {
      'de': 'Wird geladen...',
      'en': 'Loading...',
    },
    'c44xfzlg': {
      'de': 'Logo hochladen',
      'en': 'Upload logo',
    },
    '5ksjuy60': {
      'de': 'fest hinzufügen',
      'en': 'add firmly',
    },
    '0kicrtea': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'me28vcaw': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
  },
  // editEmployee
  {
    'xg8v4ks9': {
      'de': 'Mitarbeiter bearbeiten',
      'en': 'edit employees',
    },
    '5vhx92a5': {
      'de': 'Vor- und Nachname',
      'en': 'First and Last Name',
    },
    'eln32k3n': {
      'de': 'Vor- und Nachname',
      'en': 'First and Last Name',
    },
    'w23hom0z': {
      'de': 'Bild wird geladen...',
      'en': 'image is loading...',
    },
    'eym1s0jq': {
      'de': 'Bild hochladen\n',
      'en': 'Upload Image',
    },
    'yi98usm5': {
      'de': 'Jobtitel',
      'en': 'job title',
    },
    'hyiuq4ar': {
      'de': 'Kurzbeschreibung',
      'en': 'short description',
    },
    'icgacvxk': {
      'de': 'Mobil',
      'en': 'Mobile',
    },
    'tkp5k4fw': {
      'de': 'Phone',
      'en': 'phones',
    },
    '2o937gqm': {
      'de': 'Fax',
      'en': 'fax',
    },
    'zwuy6cr0': {
      'de': 'Straße & Hausnummer',
      'en': 'Street, house number',
    },
    'xahbxoil': {
      'de': 'PLZ',
      'en': 'Postcode',
    },
    'fliohxaf': {
      'de': 'Ort',
      'en': 'Location',
    },
    'no6rcw2f': {
      'de': 'Land',
      'en': 'country',
    },
    'biq3vcdv': {
      'de': 'Website',
      'en': 'site',
    },
    'il2qegkd': {
      'de': 'Whatsapp',
      'en': 'Whatsapp',
    },
    'qra2vpud': {
      'de': 'Linkedin',
      'en': 'linkedin',
    },
    'q2e0vfk2': {
      'de': 'XING',
      'en': 'XING',
    },
    'dpqj67x1': {
      'de': 'Instagram',
      'en': 'Instagram',
    },
    'mq1i0e80': {
      'de': 'Facebook',
      'en': 'Facebook',
    },
    '5fpkm4zk': {
      'de': 'TikTok',
      'en': 'tik tok',
    },
    '2elyb3qv': {
      'de': 'YouTube',
      'en': 'YouTube',
    },
    'rplr9vf5': {
      'de': 'Telegram',
      'en': 'Telegram',
    },
    'g5r1cauw': {
      'de': 'Hintergrundfarbe',
      'en': 'background color',
    },
    '0v06vvyp': {
      'de': 'Mitarbeiter löschen',
      'en': 'Delete employees',
    },
    '0dr7y7ge': {
      'de': 'Mitarbeiter aktualisieren',
      'en': 'update staff',
    },
    'bm33ua45': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'ev28tybn': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'bsxcmrtd': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    '6n5wzy7s': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'qfr7aphj': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'jttrxr4r': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'talsphw8': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'dqhgh05v': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '43335t17': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'lmpy2oo6': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '5bkog1ts': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'qg809omj': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'w0xf7sw7': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'vrc76y5b': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '86mvnou6': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    '8q7tg9it': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '9ifp5ldj': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'csze0osu': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'g7rc5jdp': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'umgdsej4': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'xmjqdjay': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'lxm4x8id': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'ck8yso8j': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'vxqvnxl4': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'ooy02r3p': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'grpu2hex': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '11ht3rnv': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'jsbbtgu1': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'y7bkbd18': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'qh3j2o43': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'qf4705qu': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'kpvspezs': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'g5jpv9li': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'a1k9zds3': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'v9ncgpqd': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'dsjkv2sa': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'ffb9ghif': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    '6yvb9wif': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
  },
  // manageProfile
  {
    'mwnd6cmw': {
      'de': 'Profil verwalten',
      'en': 'manage profile',
    },
    '6vqusho0': {
      'de': 'Upload Image',
      'en': 'Upload Image',
    },
    'yur6jj3s': {
      'de': 'Display Name Missing!',
      'en': 'Display Name Missing!',
    },
    '7ccv6fbr': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'a78n12zs': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'fwd1dj6u': {
      'de': 'enter display name',
      'en': 'enter display name',
    },
  },
  // addEmployee
  {
    'wygikczs': {
      'de': 'Neuen Mitarbeiter hinzufügen',
      'en': 'Add new employee',
    },
    '4gws3r4k': {
      'de': 'Vor- und Nachname',
      'en': 'First and Last Name',
    },
    'o3nfgd1b': {
      'de': 'Employee email',
      'en': 'Employee email',
    },
    'fhlmcebf': {
      'de': 'Bild wird geladen...',
      'en': 'image is loading...',
    },
    'yhxf68x4': {
      'de': 'Bild hochladen',
      'en': 'Upload Image',
    },
    '311te7yq': {
      'de': 'Jobtitel',
      'en': 'job title',
    },
    'kr0dglif': {
      'de': 'Kurzbeschreibung',
      'en': 'short description',
    },
    'q94di9pa': {
      'de': 'Mobil',
      'en': 'Mobile',
    },
    'ws0o3klx': {
      'de': 'Phone',
      'en': 'phones',
    },
    'rv8mqxzn': {
      'de': 'Fax',
      'en': 'fax',
    },
    'p984xr18': {
      'de': 'Straße & Hausnummer',
      'en': 'Street, house number',
    },
    'wzyrrvar': {
      'de': 'PLZ',
      'en': 'Postcode',
    },
    'eh13f5a1': {
      'de': 'Ort',
      'en': 'Location',
    },
    'vec94ec7': {
      'de': 'Land',
      'en': 'country',
    },
    'yrahtgvw': {
      'de': 'Website',
      'en': 'site',
    },
    'ugs2ugdd': {
      'de': 'Whatsapp',
      'en': 'Whatsapp',
    },
    'ktojli13': {
      'de': 'Linkedin',
      'en': 'linkedin',
    },
    '87enkt6l': {
      'de': 'XING',
      'en': 'XING',
    },
    'nkz0jbdj': {
      'de': 'Instagram',
      'en': 'Instagram',
    },
    'mrabt4pg': {
      'de': 'Facebook',
      'en': 'Facebook',
    },
    '49okzz31': {
      'de': 'TikTok',
      'en': 'tik tok',
    },
    'zl52aben': {
      'de': 'YouTube',
      'en': 'YouTube',
    },
    'lvwlsq0f': {
      'de': 'Telegram',
      'en': 'Telegram',
    },
    'fa5p04oe': {
      'de': 'Hintergrundfarbe',
      'en': 'background color',
    },
    'rii725xb': {
      'de': 'Mitarbeiter hinzufügen',
      'en': 'Add employees',
    },
    'bzlqmong': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'wlia14dk': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'rfabl5qx': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'c2p16blf': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'o2ezheut': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    '7zw2rhi5': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'pz47543s': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    '63pzyngs': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'g7ycoj6f': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'e5zeb39f': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'nb21yipg': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'gnxlpzxq': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'hpgv2ujn': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'bms4zwuy': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'wprf8ogz': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'd1qx505t': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'bv8c01xx': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    '3asxfkpd': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'rgxnmwn5': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    '27gv2ymx': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'bhr4spsd': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    '28glmhwv': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'fl4srp2g': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    't2t1o2ea': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '8pfpuvmo': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    '4757hqxt': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'j59ozo3m': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'b3luod9v': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'zk4k31vz': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'vjdywdvp': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'qx3ycqmx': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'a4pa00h2': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    'nox6fa0w': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    'ww525iw9': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '4mu06eho': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    '4j077y5k': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
    '3dsb04ot': {
      'de': 'Field is required',
      'en': 'Field is required',
    },
    '4jdbkekw': {
      'de': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
    },
  },
  // cropImage
  {
    '6z4diifi': {
      'de': 'Bild bearbeiten',
      'en': 'Edit image',
    },
  },
  // Miscellaneous
  {
    'nyah5k29': {
      'de': '',
      'en': '',
    },
    'hzh8ep3p': {
      'de': '',
      'en': '',
    },
    'b64pm26s': {
      'de': '',
      'en': '',
    },
    'z1j3xwor': {
      'de': '',
      'en': '',
    },
    'lh2pu6gs': {
      'de': '',
      'en': '',
    },
    'v2r21qyh': {
      'de': '',
      'en': '',
    },
    'zbe8rkoe': {
      'de': '',
      'en': '',
    },
    'wr66qm2v': {
      'de': '',
      'en': '',
    },
    '3iidf82e': {
      'de': '',
      'en': '',
    },
    'ft7c9fjs': {
      'de': '',
      'en': '',
    },
    '1vnp20u4': {
      'de': '',
      'en': '',
    },
    'ohc8ya3h': {
      'de': '',
      'en': '',
    },
    'dgprglum': {
      'de': '',
      'en': '',
    },
    'czfhqdhf': {
      'de': '',
      'en': '',
    },
    'iwe42jju': {
      'de': '',
      'en': '',
    },
    '9k6vk9x2': {
      'de': '',
      'en': '',
    },
    'c5gpetnv': {
      'de': '',
      'en': '',
    },
    'o0uj9mnc': {
      'de': '',
      'en': '',
    },
    '2thtr9dq': {
      'de': '',
      'en': '',
    },
    'r0gkf1rr': {
      'de': '',
      'en': '',
    },
    'sclylroe': {
      'de': '',
      'en': '',
    },
    '5lmkxoqj': {
      'de': '',
      'en': '',
    },
    '3chould1': {
      'de': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
