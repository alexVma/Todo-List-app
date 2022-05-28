import 'package:flutter/material.dart';

class TodoModel {
  int id;
  String description;
  int state;
  int userId;

  TodoModel({@required this.id, @required this.description, @required this.state, @required this.userId});


}
