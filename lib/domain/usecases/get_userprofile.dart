import 'package:dartz/dartz.dart';
import 'package:primetime/core/usecase/usecase.dart';
import 'package:primetime/domain/repository/auth.dart';
import 'package:primetime/service_locator.dart';

class GetUserProfileUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic param}) async {
    return sl<AuthRepository>().getUserProfile();
  }
}
