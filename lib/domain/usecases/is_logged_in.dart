import 'package:primetime/core/usecase/usecase.dart';
import 'package:primetime/domain/repository/auth.dart';
import 'package:primetime/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({dynamic param}) async {
    return sl<AuthRepository>().isLoggedIn();
  }

  
  
}