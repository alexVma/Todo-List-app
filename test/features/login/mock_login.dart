import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:todo/features/login/domain/entities/LoginModel.dart';
import 'package:todo/features/login/data/datasource/login_user_dao.dart';
import 'package:todo/features/login/data/model/User.dart';
import 'package:todo/features/login/data/repositories/login_repository_impl.dart';

class MockLoginUser extends Mock implements LoginUser {}

void main() {
  MockLoginUser mockLoginUser;
  LoginRepositoryImpl loginRepositoryImpl;

  setUp(() {
    mockLoginUser = MockLoginUser();
    loginRepositoryImpl = LoginRepositoryImpl(mockLoginUser);
  });

  group(' Mock Login User', () {
    final LoginModel tLogin = LoginModel(login: "1", password: "1");
    final LoginModel tLoginCorrect = LoginModel(login: "1", password: "1");
    final User user = User(id: 1, user: "admin");

    test('call datasource', () {
      when(mockLoginUser.login(tLoginCorrect)).thenAnswer((_) async => user);
      loginRepositoryImpl.login(tLogin);
      verify(mockLoginUser.login(tLogin));
    });

    test('true in good login', () async {
      when(mockLoginUser.login(tLoginCorrect)).thenAnswer((_) async => user);
      final result = await loginRepositoryImpl.login(tLoginCorrect);
      expect(result, Right(true));
    });

    test('false in bad login', () async {
      //given
      when(mockLoginUser.login(tLoginCorrect)).thenAnswer((_) async => null);
      //when
      final result = await loginRepositoryImpl.login(tLogin);
      //then
      expect(result, Right(false));
    });
  });
}