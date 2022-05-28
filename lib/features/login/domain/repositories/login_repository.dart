import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/features/login/domain/entities/LoginModel.dart';

abstract class LoginRepository {
  Future<Either<Failure, bool>> login(LoginModel login);
}
