import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfirebaselogin/src/blocs/authentication/authentication_bloc.dart';
import 'package:flutterfirebaselogin/src/repository/repository.dart';
import 'package:flutterfirebaselogin/src/simple_bloc_delegate.dart';
import 'package:flutterfirebaselogin/src/ui/app.dart';

/*
* WidgetsFlutterBinding.ensureInitialized() is required
*  in Flutter v1.9.4+ before using any plugins if the code
*  is executed before runApp.
*
* */
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(BlocProvider(
    create: (context) => AuthenticationBloc(userRepository: userRepository),
    child: App(userRepository: userRepository),
  ));
}
