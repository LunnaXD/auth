import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get badRequest => 'Solicitud incorrecta';

  @override
  String get unauthorized => 'No autorizado';

  @override
  String get forbidden => 'Acceso prohibido';

  @override
  String get internalServerError => 'Error interno del servidor';

  @override
  String get badGateway => 'Error en la puerta de enlace';

  @override
  String get other => 'Oops, algo salió mal';

  @override
  String get connectTimeout => 'Tiempo de conexión agotado con el servidor';

  @override
  String get sendTimeout => 'Tiempo de envío agotado en la conexión con el servidor';

  @override
  String get receiveTimeout => 'Tiempo de recepción agotado en la conexión con el servidor';

  @override
  String get badCertificate => 'Certificado incorrecto';

  @override
  String get cancelRequest => 'La solicitud al servidor fue cancelada';

  @override
  String get connectionError => 'Problemas de comunicación o no hay conexión a internet';

  @override
  String get unknown => 'Se produjo un error inesperado';

  @override
  String get yes => 'Si';

  @override
  String get cancel => 'Cancelar';

  @override
  String get username => 'Nombre de usuario';

  @override
  String get hintUsername => 'eve.holt@reqres.in';

  @override
  String get errorEmptyUsername => 'Por favor ingrese un nombre de usuario';

  @override
  String errorMinLengthUsername(num min) {
    return 'El nombre de usuario debe tener al menos $min caracteres';
  }

  @override
  String errorMaxLengthUsername(num max) {
    return 'El nombre de usuario no debe tener más de $max caracteres';
  }

  @override
  String get errorFormatUsername => 'El nombre de usuario solo debe contener letras, números, guiones y guiones bajos';

  @override
  String get password => 'Contraseña';

  @override
  String get hintPassword => '••••••••••••';

  @override
  String get errorEmptyPassword => 'Por favor ingrese una contraseña';

  @override
  String errorMinLengthPassword(num min) {
    return 'La contraseña debe tener al menos $min caracteres';
  }

  @override
  String errorMaxLengthPassword(num max) {
    return 'La contraseña no debe tener más de $max caracteres';
  }

  @override
  String get errorFormatPassword => 'La contraseña debe contener al menos una letra minúscula, una letra mayúscula, un número y un carácter especial';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get logoutDesc => '¿Quieres cerrar sesión en la aplicación?';

  @override
  String get dashboard => 'Tablero';

  @override
  String get settings => 'Configuración';

  @override
  String get chooseTheme => 'Escoje un tema';

  @override
  String get themeLight => 'Tema Claro';

  @override
  String get themeDark => 'Tema oscuro';

  @override
  String get themeSystem => 'Tema del sistema';

  @override
  String get chooseLanguage => 'Elije un idioma';

  @override
  String get spanish => 'Español';

  @override
  String get english => 'Ingles';
}
