import 'package:dartz/dartz.dart';
import 'package:primetime/core/usecase/usecase.dart';
import 'package:primetime/domain/repository/auth.dart';
import 'package:primetime/service_locator.dart';

import '../../data/models/signin_req_params.dart';

class SigninUseCase implements UseCase<Either, SigninReqParams> {

  @override
  Future<Either> call({SigninReqParams? param}) async {
    return await sl<AuthRepository>().signin(param!);
  }
}