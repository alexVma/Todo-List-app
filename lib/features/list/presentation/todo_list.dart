import 'package:flutter/material.dart';
import 'package:todo/features/list/data/db/app_db.dart';
import 'package:todo/features/list/data/repository/list_repository_imp.dart';
import 'package:todo/features/list/domain/entities/todo_model.dart';
import 'package:todo/features/list/domain/usescases/list_use_case.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  //final List<String> _todoList = <String>[];
  final TextEditingController _textFieldController = TextEditingController();
  List<TodoModel> allInDB=[];

  AppDB appDB;
  ListRepositoryImp listRepository;
  ListUseCase listUseCase;

  _TodoListState(){
    this.appDB=new AppDB();
    this.listRepository =new ListRepositoryImp(appDB);
    this.listUseCase =ListUseCase(listRepository);
  }

  @override
  void initState() {
    getDBItems();
  }

  void getDBItems() async {
    allInDB=await listUseCase.fetchActiveTodos();
    /*allInDB.forEach((element) {
      _todoList.add(element.description);
    });*/
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: _buildTodoItem(),//ListView(children: _getItems()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(context),
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTodoItem(String title) async  {
    TodoModel auxTodoModel=TodoModel(state: 1,description: title,userId: 1);

    int id= await listUseCase.save(auxTodoModel);
    auxTodoModel.id=id;
    //Wrapping it inside a set state will notify
    // the app that the state has changed
    setState(() {
      allInDB.add(auxTodoModel);
    });
    _textFieldController.clear();
  }

  //Generate list of item widgets
  Widget _buildTodoItem() {
    return ListView.builder(
        itemCount: allInDB.length,
        itemBuilder: (context, index) {
          final item = allInDB[index];
          return Dismissible(
              key: Key(item.description),
              onDismissed: (direction) {
                removeFromDB(item.id);
                setState(() {
                  allInDB.removeAt(index);
                });
              },
              background: Container(color: Colors.red),
              child: ListTile(
                title: Text(item.description),
              ));
        });
  }

  void removeFromDB(int id){
    listUseCase.deleteById(id);
  }

  //Generate a single item widget
  Future<AlertDialog> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a task to your List'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Enter task here'),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodoItem(_textFieldController.text);
                },
              ),
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

 /* List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (TodoModel todo in allInDB) {
      _todoWidgets.add(_buildTodoItem(todo.description));
    }
    return _todoWidgets;
  }*/
}