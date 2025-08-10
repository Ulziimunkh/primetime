import 'package:primetime/domain/entities/user.dart';

abstract class UserProfileState {}

class UserProfileInitial extends UserProfileState {}
class UserProfileLoading extends UserProfileState {}
class UserProfileLoaded extends UserProfileState {
 final UserEntity userEntity;
  UserProfileLoaded({required this.userEntity});
}
class UserProfileFailure extends UserProfileState {
  final String message;
  UserProfileFailure({required this.message});
}