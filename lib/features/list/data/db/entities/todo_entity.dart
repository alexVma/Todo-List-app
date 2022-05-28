import 'package:drift/drift.dart';

@DataClassName('Todo')
class TodosEntity extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
  IntColumn get state=> integer()();
  IntColumn get userId=> integer()();

}