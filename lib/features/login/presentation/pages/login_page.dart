import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/list/presentation/todo_list.dart';
import 'package:todo/features/login/presentation/bloc/bloc.dart';
import 'package:todo/features/login/presentation/dto/login_dto.dart';
import 'package:todo/features/login/presentation/widgets/loading_widget.dart';
import 'package:todo/injection_container.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _bloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String inputLogin;
  String inputPassword;

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _bloc = serviceLocator<LoginBloc>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocListener(
        bloc: _bloc,
        listener: (context, state) {
          if (state is ErrorLoggedState) {
            final snackBar = SnackBar(content: Text('Invalid credentials...'));
            Scaffold.of(context).showSnackBar(snackBar);
          } else if (state is LoggedState) {
            /*
            final snackBar = SnackBar(content: Text('User logged...'));
            Scaffold.of(context).showSnackBar(snackBar);
            */
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TodoList()),
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (BuildContext context, state) {
            if (state is InitialLoginState) {
              return _buildForm();
            } else if (state is CheckingLoginState) {
              return LoadingWidget();
            } else {
              return _buildForm();
            }
          },
        ),
      ),
    );
  }

  _buildForm() {
    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.list_alt,
              size: 120,
              color: Colors.lightBlue,
            ),
            Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Enter the username',
                    labelText: 'Username *',
                  ),
                  onChanged: (value) {
                    inputLogin = value;
                  },
                  validator: (String value) {
                    return value.isEmpty ? 'Username is mandatory' : null;
                  },
                )),
            Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 30),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Enter the password',
                    labelText: 'Password *',
                  ),
                  onChanged: (value) {
                    inputPassword = value;
                  },
                  validator: (String value) {
                    return value.isEmpty ? 'Password is mandatory' : null;
                  },
                )),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _bloc.add(CheckLoginEvent(
                      login: LoginDTO(
                    username: inputLogin,
                    password: inputPassword,
                  )));
                }
              },
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
