import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:todo/features/list/data/db/entities/todo_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'todo.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [TodosEntity])
class AppDB extends _$AppDB {
  AppDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Todo>> getTodos() async {
    return await (select(todosEntity)..where((tbl) => tbl.state.equals(1))).get();
  }

  Future<void> deleteTodo(int id) async {
    await (update(todosEntity)
      ..where((tbl) => tbl.id.equals(id)))
        .write(TodosEntityCompanion(
      state: Value(0),
    ));
  }

  Future<int> saveTodo(TodosEntityCompanion todosEntityCompanion) async {
    int id= await (into(todosEntity).insert(todosEntityCompanion));
  }

}
