import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../repository/repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

/*
* We are using yield* (yield-each) in mapEventToState to separate the event handlers
*  into their own functions. yield* inserts all the elements of
* the subsequence into the sequence currently being constructed,
* as if we had an individual yield for each element.
*
* */

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;
  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationAppStarted) {
      yield* _mapAuthenticationAppStartedToState();
    } else if (event is AuthenticationLoggedIn) {
      yield* _mapAuthenticationLoggedInToState();
    } else if (event is AuthenticationLoggedOut)
      yield* _mapAuthenticationLoggedOutToState();
  }

  _mapAuthenticationAppStartedToState() async* {
    final isSignedIn = await _userRepository.isSignedIn();
    if (isSignedIn) {
      final name = await _userRepository.getUser();
      yield AuthenticationAuthenticated(name);
    }
  }

  _mapAuthenticationLoggedInToState() async* {
    yield AuthenticationAuthenticated(await _userRepository.getUser());
  }

  _mapAuthenticationLoggedOutToState() async* {
    yield AuthenticationUnauthenticated();
  }
}
