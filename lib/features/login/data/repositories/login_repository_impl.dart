import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/features/login/data/datasource/login_user_dao.dart';
import 'package:todo/features/login/domain/entities/LoginModel.dart';
import 'package:todo/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginUser loginUser;

  LoginRepositoryImpl(this.loginUser);

  @override
  Future<Either<Failure, bool>> login(LoginModel login) async {
    try {
      final user = await loginUser.login(login);
      return Right(user != null);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }
}
