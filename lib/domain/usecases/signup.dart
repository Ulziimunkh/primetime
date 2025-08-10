import 'package:dartz/dartz.dart';
import 'package:primetime/core/usecase/usecase.dart';
import 'package:primetime/data/models/signup_req_params.dart';
import 'package:primetime/domain/repository/auth.dart';
import 'package:primetime/service_locator.dart';

class SignupUseCase implements UseCase<Either, SignupReqParams> {
  /// This class is responsible for handling the signup use case.
  /// It takes a [SignupReqParams] object as a parameter and returns an [Either] object.
  /// The [Either] object can either be a success or a failure.
  /// The [call] method is the entry point for this use case.
  /// It uses the [AuthRepository] to perform the signup operation.
  /// The [param] parameter is the [SignupReqParams] object that contains the signup data.
  /// The [call] method returns an [Either] object that contains the result of the signup operation.
  /// The [param] parameter is required and cannot be null.
  @override
  Future<Either> call({SignupReqParams? param}) async {
    return await sl<AuthRepository>().signup(param!);
  }
}