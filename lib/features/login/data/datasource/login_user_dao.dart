import 'package:todo/features/login/data/model/User.dart';
import 'package:todo/features/login/domain/entities/LoginModel.dart';

class LoginUser {
  Future<User> login(LoginModel login) async {
    if (login.login == "1" && login.password == "1") {
      await Future.delayed(Duration(seconds: 2));
      return User(id: 1, user: "admin");
    } else {
      return null;
    }
  }
}
