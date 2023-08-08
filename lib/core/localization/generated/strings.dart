import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'strings_es.dart';

/// Callers can lookup localized strings with an instance of Strings
/// returned by `Strings.of(context)`.
///
/// Applications need to include `Strings.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/strings.dart';
///
/// return MaterialApp(
///   localizationsDelegates: Strings.localizationsDelegates,
///   supportedLocales: Strings.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the Strings.supportedLocales
/// property.
abstract class Strings {
  Strings(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static Strings? of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  static const LocalizationsDelegate<Strings> delegate = _StringsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('es')
  ];

  /// No description provided for @badRequest.
  ///
  /// In es, this message translates to:
  /// **'Solicitud incorrecta'**
  String get badRequest;

  /// No description provided for @unauthorized.
  ///
  /// In es, this message translates to:
  /// **'No autorizado'**
  String get unauthorized;

  /// No description provided for @forbidden.
  ///
  /// In es, this message translates to:
  /// **'Acceso prohibido'**
  String get forbidden;

  /// No description provided for @internalServerError.
  ///
  /// In es, this message translates to:
  /// **'Error interno del servidor'**
  String get internalServerError;

  /// No description provided for @badGateway.
  ///
  /// In es, this message translates to:
  /// **'Error en la puerta de enlace'**
  String get badGateway;

  /// No description provided for @other.
  ///
  /// In es, this message translates to:
  /// **'Oops, algo salió mal'**
  String get other;

  /// No description provided for @connectTimeout.
  ///
  /// In es, this message translates to:
  /// **'Tiempo de conexión agotado con el servidor'**
  String get connectTimeout;

  /// No description provided for @sendTimeout.
  ///
  /// In es, this message translates to:
  /// **'Tiempo de envío agotado en la conexión con el servidor'**
  String get sendTimeout;

  /// No description provided for @receiveTimeout.
  ///
  /// In es, this message translates to:
  /// **'Tiempo de recepción agotado en la conexión con el servidor'**
  String get receiveTimeout;

  /// No description provided for @badCertificate.
  ///
  /// In es, this message translates to:
  /// **'Certificado incorrecto'**
  String get badCertificate;

  /// No description provided for @cancelRequest.
  ///
  /// In es, this message translates to:
  /// **'La solicitud al servidor fue cancelada'**
  String get cancelRequest;

  /// No description provided for @connectionError.
  ///
  /// In es, this message translates to:
  /// **'Problemas de comunicación o no hay conexión a internet'**
  String get connectionError;

  /// No description provided for @unknown.
  ///
  /// In es, this message translates to:
  /// **'Se produjo un error inesperado'**
  String get unknown;

  /// No description provided for @yes.
  ///
  /// In es, this message translates to:
  /// **'Si'**
  String get yes;

  /// No description provided for @cancel.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get cancel;

  /// No description provided for @username.
  ///
  /// In es, this message translates to:
  /// **'Nombre de usuario'**
  String get username;

  /// No description provided for @hintUsername.
  ///
  /// In es, this message translates to:
  /// **'eve.holt@reqres.in'**
  String get hintUsername;

  /// No description provided for @errorEmptyUsername.
  ///
  /// In es, this message translates to:
  /// **'Por favor ingrese un nombre de usuario'**
  String get errorEmptyUsername;

  /// Un mensaje de validacion del minimo de caracteres
  ///
  /// In es, this message translates to:
  /// **'El nombre de usuario debe tener al menos {min} caracteres'**
  String errorMinLengthUsername(num min);

  /// Un mensaje de validacion del maximo de caracteres
  ///
  /// In es, this message translates to:
  /// **'El nombre de usuario no debe tener más de {max} caracteres'**
  String errorMaxLengthUsername(num max);

  /// No description provided for @errorFormatUsername.
  ///
  /// In es, this message translates to:
  /// **'El nombre de usuario solo debe contener letras, números, guiones y guiones bajos'**
  String get errorFormatUsername;

  /// No description provided for @password.
  ///
  /// In es, this message translates to:
  /// **'Contraseña'**
  String get password;

  /// No description provided for @hintPassword.
  ///
  /// In es, this message translates to:
  /// **'••••••••••••'**
  String get hintPassword;

  /// No description provided for @errorEmptyPassword.
  ///
  /// In es, this message translates to:
  /// **'Por favor ingrese una contraseña'**
  String get errorEmptyPassword;

  /// Un mensaje de validacion del minimo de caracteres
  ///
  /// In es, this message translates to:
  /// **'La contraseña debe tener al menos {min} caracteres'**
  String errorMinLengthPassword(num min);

  /// Un mensaje de validacion del maximo de caracteres
  ///
  /// In es, this message translates to:
  /// **'La contraseña no debe tener más de {max} caracteres'**
  String errorMaxLengthPassword(num max);

  /// No description provided for @errorFormatPassword.
  ///
  /// In es, this message translates to:
  /// **'La contraseña debe contener al menos una letra minúscula, una letra mayúscula, un número y un carácter especial'**
  String get errorFormatPassword;

  /// No description provided for @signIn.
  ///
  /// In es, this message translates to:
  /// **'Iniciar sesión'**
  String get signIn;

  /// No description provided for @logout.
  ///
  /// In es, this message translates to:
  /// **'Cerrar sesión'**
  String get logout;

  /// No description provided for @logoutDesc.
  ///
  /// In es, this message translates to:
  /// **'¿Quieres cerrar sesión en la aplicación?'**
  String get logoutDesc;

  /// No description provided for @dashboard.
  ///
  /// In es, this message translates to:
  /// **'Tablero'**
  String get dashboard;

  /// No description provided for @settings.
  ///
  /// In es, this message translates to:
  /// **'Configuración'**
  String get settings;

  /// No description provided for @chooseTheme.
  ///
  /// In es, this message translates to:
  /// **'Escoje un tema'**
  String get chooseTheme;

  /// No description provided for @themeLight.
  ///
  /// In es, this message translates to:
  /// **'Tema Claro'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In es, this message translates to:
  /// **'Tema oscuro'**
  String get themeDark;

  /// No description provided for @themeSystem.
  ///
  /// In es, this message translates to:
  /// **'Tema del sistema'**
  String get themeSystem;

  /// No description provided for @chooseLanguage.
  ///
  /// In es, this message translates to:
  /// **'Elije un idioma'**
  String get chooseLanguage;

  /// No description provided for @spanish.
  ///
  /// In es, this message translates to:
  /// **'Español'**
  String get spanish;

  /// No description provided for @english.
  ///
  /// In es, this message translates to:
  /// **'Ingles'**
  String get english;
}

class _StringsDelegate extends LocalizationsDelegate<Strings> {
  const _StringsDelegate();

  @override
  Future<Strings> load(Locale locale) {
    return SynchronousFuture<Strings>(lookupStrings(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['es'].contains(locale.languageCode);

  @override
  bool shouldReload(_StringsDelegate old) => false;
}

Strings lookupStrings(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'es': return StringsEs();
  }

  throw FlutterError(
    'Strings.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
