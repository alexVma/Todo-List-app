import 'package:get_it/get_it.dart';
import 'package:todo/features/login/data/repositories/login_repository_impl.dart';
import 'package:todo/features/login/domain/repositories/login_repository.dart';
import 'package:todo/features/login/domain/usecases/login.dart';
import 'package:todo/features/login/presentation/bloc/bloc.dart';

import 'features/login/data/datasource/login_user_dao.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  initInjections(serviceLocator);
}

void initInjections(GetIt serviceLocator) {
  serviceLocator.registerFactory(
    () => LoginBloc(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => Login(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => LoginUser(),
  );
}
