import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/core/usecase/usecase.dart';
import 'package:todo/features/login/domain/entities/LoginModel.dart';
import 'package:todo/features/login/domain/repositories/login_repository.dart';
import 'package:meta/meta.dart';

class Login implements UseCase<bool, Params> {
  final LoginRepository loginRepository;

  Login(this.loginRepository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await loginRepository.login(params.login);
  }
}

class Params extends Equatable {
  final LoginModel login;

  Params({
    @required this.login,
  });

  @override
  List<Object> get props => [login];
}
