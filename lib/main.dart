import 'package:flutter/material.dart';
import 'package:todo/features/login/presentation/pages/login_page.dart';
import 'injection_container.dart' as di;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'To-Do-List', home: LoginPage());
  }
}


