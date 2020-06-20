import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfirebaselogin/src/blocs/authentication/authentication_bloc.dart';
import 'package:flutterfirebaselogin/src/repository/repository.dart';
import 'package:flutterfirebaselogin/src/ui/home_screen.dart';
import 'package:flutterfirebaselogin/src/ui/splash_screen.dart';

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationUninitialized) return SplashScreen();
        if (state is AuthenticationAuthenticated)
          return HomeScreen(name: state.displayName);
        return Text('');
      },
    ));
  }
}
