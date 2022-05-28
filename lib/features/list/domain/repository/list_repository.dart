

import 'package:todo/features/list/domain/entities/todo_model.dart';

abstract class ListRepository {
  Future<int> save(TodoModel todo);

  Future<List<TodoModel>> getActive();

  Future<void> delete(int id);
}