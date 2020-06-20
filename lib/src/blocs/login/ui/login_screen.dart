import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfirebaselogin/src/blocs/login/blocs/login.dart';
import 'package:flutterfirebaselogin/src/repository/repository.dart';
import 'package:meta/meta.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository _userRepository;

  LoginScreen({Key key, @required UserRepository userRepository})
      : _userRepository = userRepository,
        assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userRepository: _userRepository),
        child: LoginForm(userRepository: _userRepository),
      ),
    );
  }
}
