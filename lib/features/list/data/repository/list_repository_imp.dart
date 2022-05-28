

import 'package:injectable/injectable.dart';
import 'package:todo/features/list/data/db/app_db.dart';
import 'package:todo/features/list/domain/entities/todo_model.dart';
import 'package:todo/features/list/domain/repository/list_repository.dart';


class ListRepositoryImp implements ListRepository {
  
  final AppDB appDB;

  ListRepositoryImp(this.appDB);
  
  @override
  Future<void> delete(int id) {
    return appDB.deleteTodo(id);
  }

  @override
  Future<List<TodoModel>> getActive() async {
    List<Todo> listDB=await appDB.getTodos();
    List<TodoModel> listModel=[];

    listDB.forEach((todoDB) {
      listModel.add(TodoModel(state: todoDB.state,description: todoDB.description,id: todoDB.id,userId: todoDB.userId));
    });

    return listModel;
  }

  @override
  Future<int> save(TodoModel todo) {
     appDB.saveTodo(TodosEntityCompanion.insert(userId: todo.userId,description: todo.description,state: todo.state));
  }



}