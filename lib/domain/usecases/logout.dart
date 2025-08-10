import 'package:primetime/core/usecase/usecase.dart';
import 'package:primetime/domain/repository/auth.dart';
import 'package:primetime/service_locator.dart';

class LogoutUseCase implements UseCase<dynamic, dynamic> {
  @override
  Future call({ param}) async {
    await sl<AuthRepository>().logout();
  }
}