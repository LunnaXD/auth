import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:auth/core/network/network_info.dart';
import 'package:auth/data/data.dart';
import 'package:auth/domain/domain.dart';

@GenerateMocks([
  AuthRepository,
  AuthRemoteDataSource,
  AuthLocalDataSource,
  NetworkInfo,
  InternetConnectionChecker,
  CheckThemeUseCase,
  CheckLanguageUseCase,
  UpdateThemeUseCase,
  UpdateLanguageUseCase,
  LoginUseCase,
])
void main() {}
