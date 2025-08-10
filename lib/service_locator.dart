import 'package:primetime/core/network/dio_client.dart';
import 'package:primetime/data/repository/auth.dart';
import 'package:primetime/data/source/auth_api_service.dart';
import 'package:primetime/data/source/auth_local_service.dart';
import 'package:primetime/domain/repository/auth.dart';
import 'package:get_it/get_it.dart';
import 'package:primetime/domain/usecases/get_userprofile.dart';
import 'package:primetime/domain/usecases/is_logged_in.dart';
import 'package:primetime/domain/usecases/logout.dart';
import 'package:primetime/domain/usecases/signin.dart';
import 'package:primetime/domain/usecases/signup.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());
// Repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // Usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetUserProfileUseCase>(GetUserProfileUseCase());
  sl.registerSingleton<LogoutUseCase>(LogoutUseCase());
  // Add other services, repositories, and use cases as needed
}
