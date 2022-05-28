import 'package:injectable/injectable.dart';
import 'package:todo/features/list/domain/entities/todo_model.dart';
import 'package:todo/features/list/domain/repository/list_repository.dart';

@singleton
class ListUseCase{
  ListUseCase(this.listRepository);

  final ListRepository listRepository;

  Future<void> deleteById(int id) async {
   await listRepository.delete(id);
  }

  Future<List<TodoModel>> fetchActiveTodos() async {
    List<TodoModel> todos =  await listRepository.getActive();
    return todos;
  }

  Future<int> save(TodoModel todoModel) async {
    return await listRepository.save(todoModel);
  }

}